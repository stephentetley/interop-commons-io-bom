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
        pub def regionOf(_: BOMInputStream[r]): Region[r] = unsafe_cast () as Region[r]
    }


    instance Interop/IO.SubInputStream[BOMInputStream] {
        pub def toInputStream(s: BOMInputStream[r]): InputStream[r] = 
            let BOMInputStream(s1) = s;
            InputStream(unsafe_cast s1 as ##java.io.InputStream)

        pub def fromInputStream(s: InputStream[r]): BOMInputStream[r] = 
            let InputStream(s1) = s;
            BOMInputStream(unsafe_cast s1 as ##org.apache.commons.io.input.BOMInputStream) 
    }

    instance Interop/Apache/Commons/IO/Input.SubProxyInputStream[BOMInputStream] {
        pub def toProxyInputStream(s: BOMInputStream[r]): ProxyInputStream[r] = 
            let BOMInputStream(s1) = s;
            ProxyInputStream(unsafe_cast s1 as ##org.apache.commons.io.input.ProxyInputStream)

        pub def fromProxyInputStream(s: ProxyInputStream[r]): BOMInputStream[r] = 
            let ProxyInputStream(s1) = s;
            BOMInputStream(unsafe_cast s1 as ##org.apache.commons.io.input.BOMInputStream) 
    }

}


namespace Interop/Apache/Commons/IO/Input/BOMInputStream {
    
    use Interop/Apache/Commons/IO/Input.BOMInputStream;
    use Interop/Apache/Commons/IO/Input.BOMInputStream.{BOMInputStream};

    use Interop/Apache/Commons/IO.ByteOrderMark;
    use Interop/Apache/Commons/IO.ByteOrderMark.{ByteOrderMark};

    use Interop/IO.InputStream;

    pub def getHH(ins: BOMInputStream[r]): ##org.apache.commons.io.input.BOMInputStream = 
        let BOMInputStream(ins1) = ins;
        ins1

    /// Take a new region or use existing?
    pub def new(ins: InputStream[r]): BOMInputStream[r] \ Write(r) =
        import new org.apache.commons.io.input.BOMInputStream(##java.io.InputStream): ##org.apache.commons.io.input.BOMInputStream \ r as newBOMInputStream;
        let ins1 = Interop/IO/InputStream.getHH(ins);
        BOMInputStream(newBOMInputStream(ins1))


    pub def newWithInclude(includeBOM: Bool, ins: InputStream[r]): BOMInputStream[r] \ Write(r) =
        import new org.apache.commons.io.input.BOMInputStream(##java.io.InputStream, Bool): ##org.apache.commons.io.input.BOMInputStream \ r as newBOMInputStream;
        let ins1 = Interop/IO/InputStream.getHH(ins);
        BOMInputStream(newBOMInputStream(ins1, includeBOM))

    pub def getBOM(ins: BOMInputStream[r]): Result[Option[ByteOrderMark], String] \ Read(r) = 
        try {
            import org.apache.commons.io.input.BOMInputStream.getBOM(): ##org.apache.commons.io.ByteOrderMark \ r;
            let BOMInputStream(ins1) = ins;
            getBOM(ins1) |> Object.toOption |> Option.map(ByteOrderMark) |> Ok 
        } catch {
            case ex: ##java.lang.Exception =>
                import java.lang.Throwable.getMessage(): String \ {};
                Err(getMessage(ex))
        }
        

    pub def getBOMCharsetName(ins: BOMInputStream[r]): Result[Option[String], String] \ Read(r) = 
        try {
            import org.apache.commons.io.input.BOMInputStream.getBOMCharsetName(): String \ r;
            let BOMInputStream(ins1) = ins;
            getBOMCharsetName(ins1) |> Object.toOption |> Ok
        } catch {
            case ex: ##java.lang.Exception =>
                import java.lang.Throwable.getMessage(): String \ {};
                Err(getMessage(ex))
        }
        
    pub def hasBOM(ins: BOMInputStream[r]): Result[Bool, String] \ Read(r) = 
        try {
            import org.apache.commons.io.input.BOMInputStream.hasBOM(): Bool \ r;
            let BOMInputStream(ins1) = ins;
            hasBOM(ins1) |> Ok
        } catch {
            case ex: ##java.lang.Exception =>
                import java.lang.Throwable.getMessage(): String \ {};
                Err(getMessage(ex))
        }


    pub def mark!(limit: Int32, ins: BOMInputStream[r]): Unit \ Write(r) = 
        import org.apache.commons.io.input.BOMInputStream.mark(Int32): Unit \ r;
        let BOMInputStream(ins1) = ins;
        mark(ins1, limit)

    /// -1 for end-of-stream
    pub def read!(ins: BOMInputStream[r]): Result[Int32, String] \ {Read(r), Write(r) } = 
        try {
            import org.apache.commons.io.input.BOMInputStream.read(): Int32 \ r;
            let BOMInputStream(ins1) = ins;
            read(ins1) |> Ok
        } catch {
            case ex: ##java.lang.Exception =>
                import java.lang.Throwable.getMessage(): String \ {};
                Err(getMessage(ex))
        }

    pub def reset!(ins: BOMInputStream[r]): Result[Unit, String] \ Write(r) = 
        try {
            import org.apache.commons.io.input.BOMInputStream.reset(): Unit \ r;
            let BOMInputStream(ins1) = ins;
            reset(ins1) |> Ok
        } catch {
            case ex: ##java.lang.Exception =>
                import java.lang.Throwable.getMessage(): String \ {};
                Err(getMessage(ex))
        }

    pub def skip!(n: Int64, ins: BOMInputStream[r]): Result[Int64, String] \ Write(r) = 
        try {
            import org.apache.commons.io.input.BOMInputStream.skip(Int64): Int64 \ r;
            let BOMInputStream(ins1) = ins;
            skip(ins1, n) |> Ok
        } catch {
            case ex: ##java.lang.Exception =>
                import java.lang.Throwable.getMessage(): String \ {};
                Err(getMessage(ex))
        }
}
