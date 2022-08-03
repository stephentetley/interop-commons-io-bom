/*
 * Copyright 2020 Stephen Tetley
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


namespace Interop/System/File {

    pub enum BOMInputStream[_: Region](##org.apache.commons.io.input.BOMInputStream)


}


namespace Interop/System/File/BOMInputStream {
    
    use Interop/System/File.BOMInputStream;
    use Interop/System/File.BOMInputStream.{BOMInputStream};

    use Interop/System/File.BOM;
    use Interop/System/File.BOM.{BOM};

    pub def new(_: Region[r], ins: ##java.io.InputStream): BOMInputStream[r] \ Write(r) =
        import new org.apache.commons.io.input.BOMInputStream(##java.io.InputStream): ##org.apache.commons.io.input.BOMInputStream \ r as newBOMInputStream;
        BOMInputStream(newBOMInputStream(ins))

    pub def newWithInclude(_: Region[r], ins: ##java.io.InputStream, incl: Bool): BOMInputStream[r] \ Write(r) =
        import new org.apache.commons.io.input.BOMInputStream(##java.io.InputStream, Bool): ##org.apache.commons.io.input.BOMInputStream \ r as newBOMInputStream;
        BOMInputStream(newBOMInputStream(ins, incl))

    pub def getBOM(ins: BOMInputStream[r]): BOM \ Read(r) = 
        import org.apache.commons.io.input.BOMInputStream.getBOM(): ##org.apache.commons.io.ByteOrderMark \ r;
        let BOMInputStream(ins1) = ins;
        BOM(getBOM(ins1))

    pub def getBOMCharsetName(ins: BOMInputStream[r]): String \ Read(r) = 
        import org.apache.commons.io.input.BOMInputStream.getBOMCharsetName(): String \ r;
        let BOMInputStream(ins1) = ins;
        getBOMCharsetName(ins1)

    pub def hasBOM(ins: BOMInputStream[r]): Bool \ Read(r) = 
        import org.apache.commons.io.input.BOMInputStream.hasBOM(): Bool \ r;
        let BOMInputStream(ins1) = ins;
        hasBOM(ins1)

    pub def mark(limit: Int32, ins: BOMInputStream[r]): Unit \ IO = 
        import org.apache.commons.io.input.BOMInputStream.mark(Int32): Unit \ IO;
        let BOMInputStream(ins1) = ins;
        mark(ins1, limit)

    pub def read(ins: BOMInputStream[r]): Int32 \ {Read(r), IO } = 
        import org.apache.commons.io.input.BOMInputStream.read(): Int32 \ IO;
        let BOMInputStream(ins1) = ins;
        read(ins1)


    pub def reset(ins: BOMInputStream[r]): Unit \ IO = 
        import org.apache.commons.io.input.BOMInputStream.reset(): Unit \ IO;
        let BOMInputStream(ins1) = ins;
        reset(ins1)

    pub def skip(n: Int64, ins: BOMInputStream[r]): Int64 \ IO = 
        import org.apache.commons.io.input.BOMInputStream.skip(Int64): Int64 \ IO;
        let BOMInputStream(ins1) = ins;
        skip(ins1, n)

}
