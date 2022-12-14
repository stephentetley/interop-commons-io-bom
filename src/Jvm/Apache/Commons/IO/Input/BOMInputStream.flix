/*
 * Copyright 2022 Stephen Tetley
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


namespace Jvm/Apache/Commons/IO/Input {


    pub type alias BOMInputStream[r: Region] = Interop/Apache/Commons/IO/Input.BOMInputStream[r]


}


namespace Jvm/Apache/Commons/IO/Input/BOMInputStream {
    
    use Basis/NIO/Charset.Charset;
    use Basis/NIO/File.Path;
    use Basis/NIO/File.OpenOption;
    use Basis/IO.InputStream;
    use Basis/IO.BufferedReader;
    use Jvm/Apache/Commons/IO.ByteOrderMark;
    use Jvm/Apache/Commons/IO/Input.BOMInputStream;
    use Interop/Apache/Commons/IO/Input.ProxyInputStream;

    pub def new(ins: InputStream[r]): BOMInputStream[r] \ Write(r) = 
        Interop/Apache/Commons/IO/Input/BOMInputStream.new(ins)

    pub def newBOMInputStream(r: Region[r], p: Path, opts: List[OpenOption]): Result[BOMInputStream[r], String] \ {IO, Write(r)} = 
        Basis/NIO/File/Files.newInputStream(r, p, opts) |> Result.map(new)


    def toInputStream(ins: BOMInputStream[r]): InputStream[r] = 
        Interop/IO/SubInputStream.toInputStream(ins)

    def toProxyInputStream(ins: BOMInputStream[r]): ProxyInputStream[r] = 
        Interop/Apache/Commons/IO/Input/SubProxyInputStream.toProxyInputStream(ins)

    // pub def newWithInclude[r: Region, stream: Region -> Type](_: Region[r], 
    //                                                             ins: stream[r], 
    //                                                             incl: Bool): BOMInputStream[r] \ Write(r) with SubInputStream[stream] =
    //     import new org.apache.commons.io.input.BOMInputStream(##java.io.InputStream, Bool): ##org.apache.commons.io.input.BOMInputStream \ r as newBOMInputStream;
    //     let ins1 = Interop/IO/InputStream.getHH(Interop/IO/SubInputStream.toInputStream(ins));
    //     BOMInputStream(newBOMInputStream(ins1, incl))

    pub def getBOM(ins: BOMInputStream[r]): Result[Option[ByteOrderMark], String] \ Read(r) = 
        Interop/Apache/Commons/IO/Input/BOMInputStream.getBOM(ins)

    pub def getBOMCharsetName(ins: BOMInputStream[r]): Result[Option[String], String] \ Read(r) = 
        Interop/Apache/Commons/IO/Input/BOMInputStream.getBOMCharsetName(ins)

    pub def hasBOM(ins: BOMInputStream[r]): Result[Bool, String] \ Read(r) = 
        Interop/Apache/Commons/IO/Input/BOMInputStream.hasBOM(ins)

    pub def available(ins: BOMInputStream[r]): Result[Int32, String] \ Read(r) = 
        toProxyInputStream(ins) |> Interop/Apache/Commons/IO/Input/ProxyInputStream.available


    pub def mark!(limit: Int32, ins: BOMInputStream[r]): Unit \ Write(r) = 
        Interop/Apache/Commons/IO/Input/BOMInputStream.mark!(limit, ins)


    pub def markSupported(ins: BOMInputStream[r]): Bool \ Read(r) = 
        toProxyInputStream(ins) |> Interop/Apache/Commons/IO/Input/ProxyInputStream.markSupported


    pub def read!(ins: BOMInputStream[r]): Result[Int32, String] \ {Read(r), Write(r)} = 
        Interop/Apache/Commons/IO/Input/BOMInputStream.read!(ins)


    pub def reset!(ins: BOMInputStream[r]): Result[Unit, String] \ Write(r) =
        Interop/Apache/Commons/IO/Input/BOMInputStream.reset!(ins)

    pub def skip!(n: Int64, ins: BOMInputStream[r]): Result[Int64, String] \ Write(r) = 
        Interop/Apache/Commons/IO/Input/BOMInputStream.skip!(n, ins)


    pub def close!(ins: BOMInputStream[r]): Result[Unit, String] \ Write(r) = 
        toProxyInputStream(ins) |> Interop/Apache/Commons/IO/Input/ProxyInputStream.close!

    /// Get remaining input...
    pub def getString(cs: Charset, ins: BOMInputStream[r]): Result[String, String] \ Read(r) = 
        let ins1 = Interop/IO/SubInputStream.toInputStream(ins);
        Interop/Apache/Commons/IO/IOUtils.toStringFromInputStream(ins1, cs)


    pub def readStringWithBOM(path: Path): Result[String, String] \ IO = region r1 {
        use Result.flatMap;
        let* fis    = Basis/IO/FileInputStream.newWithPath(r1, path);
        let bomIns  = Basis/IO/FileInputStream.toInputStream(fis) |> new;
        let* oname  = getBOMCharsetName(bomIns);
        let* cs = match oname {
            case None       => Basis/NIO/Charset/Charset.utf_16() |> Ok
            case Some(name) => Basis/NIO/Charset/Charset.forName(name) |> Option.toOk("Unknown charset: ${name}")
        };
        let rd      = toInputStream(bomIns) |> flip(Basis/IO/InputStreamReader.newInputStreamReader, cs);
        let* ans    = Basis/IO/InputStreamReader.toReader(rd) |> Interop/Apache/Commons/IO/IOUtils.toStringFromReader;
        let* _      = Basis/IO/InputStreamReader.close!(rd);
        Ok(ans)
    }

    pub def bufferedReaderWithBOM(r: Region[r], path: Path): Result[BufferedReader[r], String] \ IO =
        use Result.flatMap;
        let* fis    = Basis/IO/FileInputStream.newWithPath(r, path);
        let bomIns  = Basis/IO/FileInputStream.toInputStream(fis) |> new;
        let* oname  = getBOMCharsetName(bomIns);
        let* cs = match oname {
            case None       => Basis/NIO/Charset/Charset.utf_16() |> Ok
            case Some(name) => Basis/NIO/Charset/Charset.forName(name) |> Option.toOk("Unknown charset: ${name}")
        };
        let rd      = toInputStream(bomIns) |> flip(Basis/IO/InputStreamReader.newInputStreamReader, cs);
        let ans     = Basis/IO/InputStreamReader.toReader(rd) |> Basis/IO/BufferedReader.newWithReader;
        Ok(ans)

}
