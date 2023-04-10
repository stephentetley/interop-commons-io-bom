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


mod Interop.Apache.Commons.IO.Input {

    use Interop.IO.InputStream
    use Interop.IO.InputStream.{InputStream}
    use Interop.Apache.Commons.IO.Input.ProxyInputStream
    use Interop.Apache.Commons.IO.Input.ProxyInputStream.{ProxyInputStream}
    use Interop.Apache.Commons.IO.Input.BOMInputStream
    use Interop.Apache.Commons.IO.Input.BOMInputStream.{BOMInputStream}

    pub enum BOMInputStream[_: Region](##org.apache.commons.io.input.BOMInputStream)


    instance Interop.IO.SubInputStream[BOMInputStream] {
        pub def toInputStream(s: BOMInputStream[r]): InputStream[r] = 
            let BOMInputStream(s1) = s;
            InputStream(unchecked_cast(s1 as ##java.io.InputStream))

        pub def fromInputStream(s: InputStream[r]): BOMInputStream[r] = 
            let InputStream(s1) = s;
            BOMInputStream(unchecked_cast(s1 as ##org.apache.commons.io.input.BOMInputStream))
    }

    instance Interop.Apache.Commons.IO.Input.SubProxyInputStream[BOMInputStream] {
        pub def toProxyInputStream(s: BOMInputStream[r]): ProxyInputStream[r] = 
            let BOMInputStream(s1) = s;
            ProxyInputStream(unchecked_cast(s1 as ##org.apache.commons.io.input.ProxyInputStream))

        pub def fromProxyInputStream(s: ProxyInputStream[r]): BOMInputStream[r] = 
            let ProxyInputStream(s1) = s;
            BOMInputStream(unchecked_cast(s1 as ##org.apache.commons.io.input.BOMInputStream))
    }

}


mod Interop.Apache.Commons.IO.Input.BOMInputStream {
    
    use Interop.Apache.Commons.IO.Input.BOMInputStream
    use Interop.Apache.Commons.IO.Input.BOMInputStream.{BOMInputStream}

    use Interop.Apache.Commons.IO.ByteOrderMark
    use Interop.Apache.Commons.IO.ByteOrderMark.{ByteOrderMark}

    use Interop.IO.InputStream

    pub def getHH(ins: BOMInputStream[r]): ##org.apache.commons.io.input.BOMInputStream = 
        let BOMInputStream(ins1) = ins;
        ins1

    pub def wrapHH(_: Region[r], prim: ##org.apache.commons.io.input.BOMInputStream): BOMInputStream[r] =
        BOMInputStream(prim)


    /// Take a new region...
    pub def new(_: Region[r1], ins: InputStream[r]): BOMInputStream[r1] \ { Read(r), Write(r1) } =
        import new org.apache.commons.io.input.BOMInputStream(##java.io.InputStream): ##org.apache.commons.io.input.BOMInputStream \ {r, r1} as newBOMInputStream;
        let ins1 = Interop.IO.InputStream.getHH(ins);
        BOMInputStream(newBOMInputStream(ins1))


    pub def newWithInclude(_: Region[r1], includeBOM: Bool, ins: InputStream[r]): BOMInputStream[r1] \ { Read(r), Write(r1) } =
        import new org.apache.commons.io.input.BOMInputStream(##java.io.InputStream, Bool): ##org.apache.commons.io.input.BOMInputStream \ {r, r1} as newBOMInputStream;
        let ins1 = Interop.IO.InputStream.getHH(ins);
        BOMInputStream(newBOMInputStream(ins1, includeBOM))

    pub def getBOM(ins: BOMInputStream[r]): Result[String, Option[ByteOrderMark]] \ Read(r) = 
        Result.tryCatch(_ -> {
            import org.apache.commons.io.input.BOMInputStream.getBOM(): ##org.apache.commons.io.ByteOrderMark \ r;
            let BOMInputStream(ins1) = ins;
            getBOM(ins1) |> Object.toOption |> Option.map(ByteOrderMark)
        })
        

    pub def getBOMCharsetName(ins: BOMInputStream[r]): Result[String, Option[String]] \ Read(r) = 
        Result.tryCatch(_ -> {
            import org.apache.commons.io.input.BOMInputStream.getBOMCharsetName(): String \ r;
            let BOMInputStream(ins1) = ins;
            getBOMCharsetName(ins1) |> Object.toOption
        })
        
    pub def hasBOM(ins: BOMInputStream[r]): Result[String, Bool] \ Read(r) = 
        Result.tryCatch(_ -> {
            import org.apache.commons.io.input.BOMInputStream.hasBOM(): Bool \ r;
            let BOMInputStream(ins1) = ins;
            hasBOM(ins1)
        })


    pub def mark!(limit: Int32, ins: BOMInputStream[r]): Unit \ Write(r) = 
        import org.apache.commons.io.input.BOMInputStream.mark(Int32): Unit \ r;
        let BOMInputStream(ins1) = ins;
        mark(ins1, limit)

    /// -1 for end-of-stream
    pub def read!(ins: BOMInputStream[r]): Result[String, Int32] \ {Read(r), Write(r) } = 
        Result.tryCatch(_ -> {
            import org.apache.commons.io.input.BOMInputStream.read(): Int32 \ r;
            let BOMInputStream(ins1) = ins;
            read(ins1)
        })

    pub def reset!(ins: BOMInputStream[r]): Result[String, Unit] \ Write(r) = 
        Result.tryCatch(_ -> {
            import org.apache.commons.io.input.BOMInputStream.reset(): Unit \ r;
            let BOMInputStream(ins1) = ins;
            reset(ins1)
        })

    pub def skip!(n: Int64, ins: BOMInputStream[r]): Result[String, Int64] \ Write(r) = 
        Result.tryCatch(_ -> {
            import org.apache.commons.io.input.BOMInputStream.skip(Int64): Int64 \ r;
            let BOMInputStream(ins1) = ins;
            skip(ins1, n)
        })

}
