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


mod Apache.Commons.IO.Input {

    pub enum BOMInputStream[_: Region](##org.apache.commons.io.input.BOMInputStream)
}


mod Apache.Commons.IO.Input.BOMInputStream {
    
    use Apache.Commons.IO.Input.BOMInputStream
    use Apache.Commons.IO.Input.BOMInputStream.{BOMInputStream}

    use Apache.Commons.IO.ByteOrderMark
    use Apache.Commons.IO.ByteOrderMark.{ByteOrderMark}

    use Basis.IO.InputStream
    use Basis.IO.InputStream.{InputStream}


    /// Takes a new region...
    pub def new(_: Region[r1], s: InputStream[r]): BOMInputStream[r1] \ {r, r1} =
        import new org.apache.commons.io.input.BOMInputStream(##java.io.InputStream): ##org.apache.commons.io.input.BOMInputStream \ {r, r1} as newBOMInputStream;
        let InputStream(s1) = s;
        BOMInputStream(newBOMInputStream(s1))


    pub def newWithInclude(_: Region[r1], includeBOM: Bool, s: InputStream[r]): BOMInputStream[r1] \ {r, r1} =
        import new org.apache.commons.io.input.BOMInputStream(##java.io.InputStream, Bool): ##org.apache.commons.io.input.BOMInputStream \ {r, r1} as newBOMInputStream;
        let InputStream(s1) = s;
        BOMInputStream(newBOMInputStream(s1, includeBOM))

    pub def getBOM(ins: BOMInputStream[r]): Result[String, Option[ByteOrderMark]] \ r = 
        Result.tryCatch(_ -> {
            import org.apache.commons.io.input.BOMInputStream.getBOM(): ##org.apache.commons.io.ByteOrderMark \ r;
            let BOMInputStream(ins1) = ins;
            getBOM(ins1) |> Object.toOption |> Option.map(ByteOrderMark)
        })
        

    pub def getBOMCharsetName(ins: BOMInputStream[r]): Result[String, Option[String]] \ r = 
        Result.tryCatch(_ -> {
            import org.apache.commons.io.input.BOMInputStream.getBOMCharsetName(): String \ r;
            let BOMInputStream(ins1) = ins;
            getBOMCharsetName(ins1) |> Object.toOption
        })
        
    pub def hasBOM(ins: BOMInputStream[r]): Result[String, Bool] \ r = 
        Result.tryCatch(_ -> {
            import org.apache.commons.io.input.BOMInputStream.hasBOM(): Bool \ r;
            let BOMInputStream(ins1) = ins;
            hasBOM(ins1)
        })


    pub def mark!(limit: Int32, ins: BOMInputStream[r]): Unit \ r = 
        import org.apache.commons.io.input.BOMInputStream.mark(Int32): Unit \ r;
        let BOMInputStream(ins1) = ins;
        mark(ins1, limit)

    /// -1 for end-of-stream
    pub def read!(ins: BOMInputStream[r]): Result[String, Int32] \ r = 
        Result.tryCatch(_ -> {
            import org.apache.commons.io.input.BOMInputStream.read(): Int32 \ r;
            let BOMInputStream(ins1) = ins;
            read(ins1)
        })

    pub def reset!(ins: BOMInputStream[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import org.apache.commons.io.input.BOMInputStream.reset(): Unit \ r;
            let BOMInputStream(ins1) = ins;
            reset(ins1)
        })

    pub def skip!(n: Int64, ins: BOMInputStream[r]): Result[String, Int64] \ r = 
        Result.tryCatch(_ -> {
            import org.apache.commons.io.input.BOMInputStream.skip(Int64): Int64 \ r;
            let BOMInputStream(ins1) = ins;
            skip(ins1, n)
        })

}
