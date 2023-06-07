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


mod Interop.Apache.Commons.IO.IOUtils {
    
    use Interop.IO.InputStream
    use Interop.IO.Reader
    use Interop.NIO.Charset.Charset

    pub def toStringFromInputStream(s: InputStream[r], cs: Charset): Result[String, String] \ r = 
        Result.tryCatch(_ -> {
            import static org.apache.commons.io.IOUtils.toString(##java.io.InputStream, ##java.nio.charset.Charset): String \ r;
            let s1 = Interop.IO.InputStream.getHH(s);
            let cs1 = Interop.NIO.Charset.Charset.getHH(cs);
            toString(s1, cs1)
        })

    pub def toStringFromReader(rd: Reader[r]): Result[String, String] \ r = 
        Result.tryCatch(_ -> {
            import static org.apache.commons.io.IOUtils.toString(##java.io.Reader): String \ r;
            let rd1 = Interop.IO.Reader.getHH(rd);
            toString(rd1)
        })

}
