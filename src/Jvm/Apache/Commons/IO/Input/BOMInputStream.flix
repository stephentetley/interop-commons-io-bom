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
    use Basis/IO.InputStream;
    use Jvm/Apache/Commons/IO/Input.BOMInputStream;
    use Jvm/Apache/Commons/IO.ByteOrderMark;

    pub def new(ins: InputStream[r]): BOMInputStream[r] \ Write(r) = 
        Interop/Apache/Commons/IO/Input/BOMInputStream.new(ins)


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

    pub def mark!(limit: Int32, ins: BOMInputStream[r]): Unit \ Write(r) = 
        Interop/Apache/Commons/IO/Input/BOMInputStream.mark!(limit, ins)

    pub def read!(ins: BOMInputStream[r]): Result[Int32, String] \ {Read(r), Write(r)} = 
        Interop/Apache/Commons/IO/Input/BOMInputStream.read!(ins)


    pub def reset!(ins: BOMInputStream[r]): Result[Unit, String] \ Write(r) =
        Interop/Apache/Commons/IO/Input/BOMInputStream.reset!(ins)

    pub def skip!(n: Int64, ins: BOMInputStream[r]): Result[Int64, String] \ Write(r) = 
        Interop/Apache/Commons/IO/Input/BOMInputStream.skip!(n, ins)


    /// Get remaining input...
    pub def getString(cs: Charset, ins: BOMInputStream[r]): Result[String, String] \ Read(r) = 
        let ins1 = Interop/IO/SubInputStream.toInputStream(ins);
        Interop/Apache/Commons/IO/IOUtils.inputStreamToString(ins1, cs)


}
