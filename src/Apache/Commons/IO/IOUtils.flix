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


mod Apache.Commons.IO.IOUtils {
    
    use Charset.{Charset}

    use Basis.IO.InputStream
    use Basis.IO.InputStream.{InputStream}
    use Basis.IO.Reader
    use Basis.IO.Reader.{Reader}

    pub def toStringFromInputStream(cs: Charset, s: InputStream[r]): Result[String, String] \ r = 
        Result.tryCatch(_ -> {
            import static org.apache.commons.io.IOUtils.toString(##java.io.InputStream, ##java.nio.charset.Charset): String \ r;
            let InputStream(s1) = s;
            let Charset(cs1) = cs;
            toString(s1, cs1)
        })

    pub def toStringFromReader(r: Reader[r]): Result[String, String] \ r = 
        Result.tryCatch(_ -> {
            import static org.apache.commons.io.IOUtils.toString(##java.io.Reader): String \ r;
            let Reader(r1) = r;
            toString(r1)
        })

}
