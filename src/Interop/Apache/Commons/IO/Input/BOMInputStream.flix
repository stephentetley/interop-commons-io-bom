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


namespace Interop/Apache/Commons/IO/Input {

    use Interop/IO.InputStream;
    use Interop/IO.InputStream.{InputStream};


    pub enum BOMInputStream[_: Region](##org.apache.commons.io.input.BOMInputStream)

    instance Scoped[BOMInputStream] {
        pub def regionOf(_: BOMInputStream[r]): Region[r] = () as Region[r]
    }


    instance Interop/IO.SubInputStream[BOMInputStream] {
        pub def ucast(s: BOMInputStream[r]): InputStream[r] = 
            let BOMInputStream(s1) = s;
            InputStream(s1 as ##java.io.InputStream)

        pub def dcast(s: InputStream[r]): BOMInputStream[r] = 
            let InputStream(s1) = s;
            BOMInputStream(s1 as ##org.apache.commons.io.input.BOMInputStream) 
    }

}


namespace Interop/Apache/Commons/IO/Input/BOMInputStream {
    
    use Interop/Apache/Commons/IO/Input.BOMInputStream;
    use Interop/Apache/Commons/IO/Input.BOMInputStream.{BOMInputStream};

    use Interop/Apache/Commons/IO.ByteOrderMark;
    use Interop/Apache/Commons/IO.ByteOrderMark.{ByteOrderMark};

    use Interop/IO.SubInputStream;

    pub def getHH(ins: BOMInputStream[r]): ##org.apache.commons.io.input.BOMInputStream = 
        let BOMInputStream(ins1) = ins;
        ins1

    /// TODO - probably don't want region param...
    pub def new[r: Region, stream: Region -> Type](_: Region[r], ins: stream[r]): BOMInputStream[r] \ Write(r) with SubInputStream[stream] =
        import new org.apache.commons.io.input.BOMInputStream(##java.io.InputStream): ##org.apache.commons.io.input.BOMInputStream \ r as newBOMInputStream;
        let ins1 = Interop/IO/InputStream.getHH(Interop/IO/SubInputStream.ucast(ins));
        BOMInputStream(newBOMInputStream(ins1))

    /// TODO - probably don't want region param...
    pub def newWithInclude[r: Region, stream: Region -> Type](_: Region[r], 
                                                                ins: stream[r], 
                                                                incl: Bool): BOMInputStream[r] \ Write(r) with SubInputStream[stream] =
        import new org.apache.commons.io.input.BOMInputStream(##java.io.InputStream, Bool): ##org.apache.commons.io.input.BOMInputStream \ r as newBOMInputStream;
        let ins1 = Interop/IO/InputStream.getHH(Interop/IO/SubInputStream.ucast(ins));
        BOMInputStream(newBOMInputStream(ins1, incl))

    pub def getBOM(ins: BOMInputStream[r]): ByteOrderMark \ Read(r) = 
        import org.apache.commons.io.input.BOMInputStream.getBOM(): ##org.apache.commons.io.ByteOrderMark \ r;
        let BOMInputStream(ins1) = ins;
        ByteOrderMark(getBOM(ins1))

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
