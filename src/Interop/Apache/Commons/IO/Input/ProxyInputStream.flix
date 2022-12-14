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


    pub enum ProxyInputStream[_: Region](##org.apache.commons.io.input.ProxyInputStream)

    instance Scoped[ProxyInputStream] {
        pub def regionOf(_: ProxyInputStream[r]): Region[r] = unsafe_cast () as Region[r]
    }


    pub class SubProxyInputStream[t: Region -> Type] {
        pub def toProxyInputStream[r: Region](s: t[r]): ProxyInputStream[r]
        pub def fromProxyInputStream[r: Region](s: ProxyInputStream[r]): t[r]
    }

    instance Interop/IO.SubInputStream[ProxyInputStream] {
        pub def toInputStream(s: ProxyInputStream[r]): InputStream[r] = 
            let ProxyInputStream(s1) = s;
            InputStream(unsafe_cast s1 as ##java.io.InputStream)

        pub def fromInputStream(s: InputStream[r]): ProxyInputStream[r] = 
            let InputStream(s1) = s;
            ProxyInputStream(unsafe_cast s1 as ##org.apache.commons.io.input.ProxyInputStream) 
    }

}


namespace Interop/Apache/Commons/IO/Input/ProxyInputStream {
    
    use Interop/Apache/Commons/IO/Input.ProxyInputStream;
    use Interop/Apache/Commons/IO/Input.ProxyInputStream.{ProxyInputStream};

    use Interop/Apache/Commons/IO.ByteOrderMark;
    use Interop/Apache/Commons/IO.ByteOrderMark.{ByteOrderMark};

    use Interop/IO.InputStream;

    pub def getHH(ins: ProxyInputStream[r]): ##org.apache.commons.io.input.ProxyInputStream = 
        let ProxyInputStream(ins1) = ins;
        ins1

    /// Take a new region or use existing?
    pub def new(ins: InputStream[r]): ProxyInputStream[r] \ Write(r) =
        import new org.apache.commons.io.input.ProxyInputStream(##java.io.InputStream): ##org.apache.commons.io.input.ProxyInputStream \ r as newProxyInputStream;
        let ins1 = Interop/IO/InputStream.getHH(ins);
        newProxyInputStream(ins1) |>  ProxyInputStream


        


    pub def mark!(limit: Int32, ins: ProxyInputStream[r]): Unit \ Write(r) = 
        import org.apache.commons.io.input.ProxyInputStream.mark(Int32): Unit \ r;
        let ProxyInputStream(ins1) = ins;
        mark(ins1, limit)


    pub def available(ins: ProxyInputStream[r]): Result[Int32, String] \ Read(r) = 
        try {
            import org.apache.commons.io.input.ProxyInputStream.available(): Int32 \ r;
            let ProxyInputStream(ins1) = ins;
            available(ins1) |> Ok
        } catch {
            case ex: ##java.lang.Exception =>
                import java.lang.Throwable.getMessage(): String \ {};
                Err(getMessage(ex))
        }

    pub def markSupported(ins: ProxyInputStream[r]): Bool \ Read(r) = 
        import org.apache.commons.io.input.ProxyInputStream.markSupported(): Bool \ r;
        let ProxyInputStream(ins1) = ins;
        markSupported(ins1)


    /// -1 for end-of-stream
    pub def read!(ins: ProxyInputStream[r]): Result[Int32, String] \ Read(r) = 
        try {
            import org.apache.commons.io.input.ProxyInputStream.read(): Int32 \ r;
            let ProxyInputStream(ins1) = ins;
            read(ins1) |> Ok
        } catch {
            case ex: ##java.lang.Exception =>
                import java.lang.Throwable.getMessage(): String \ {};
                Err(getMessage(ex))
        }

    pub def reset!(ins: ProxyInputStream[r]): Result[Unit, String] \ Write(r) = 
        try {
            import org.apache.commons.io.input.ProxyInputStream.reset(): Unit \ r;
            let ProxyInputStream(ins1) = ins;
            reset(ins1) |> Ok
        } catch {
            case ex: ##java.lang.Exception =>
                import java.lang.Throwable.getMessage(): String \ {};
                Err(getMessage(ex))
        }

    pub def skip!(n: Int64, ins: ProxyInputStream[r]): Result[Int64, String] \ Write(r) = 
        try {
            import org.apache.commons.io.input.ProxyInputStream.skip(Int64): Int64 \ r;
            let ProxyInputStream(ins1) = ins;
            skip(ins1, n) |> Ok
        } catch {
            case ex: ##java.lang.Exception =>
                import java.lang.Throwable.getMessage(): String \ {};
                Err(getMessage(ex))
        }

    pub def close!(ins: ProxyInputStream[r]): Result[Unit, String] \ Write(r) = 
        try {
            import org.apache.commons.io.input.ProxyInputStream.close(): Unit \ r;
            let ProxyInputStream(ins1) = ins;
            close(ins1) |> Ok
        } catch {
            case ex: ##java.lang.Exception =>
                import java.lang.Throwable.getMessage(): String \ {};
                Err(getMessage(ex))
        }


}
