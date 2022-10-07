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


namespace Interop/Apache/Commons/IO/IOUtils {
    
    use Interop/IO.InputStream;
    use Interop/NIO/Charset.Charset;

    pub def inputStreamToString(s: InputStream[r], cs: Charset): Result[String, String] \ Read(r) = 
        try {
            import static org.apache.commons.io.IOUtils.toString(##java.io.InputStream, ##java.nio.charset.Charset ): String \ r;
            let s1 = Interop/IO/InputStream.getHH(s);
            let cs1 = Interop/NIO/Charset/Charset.getHH(cs);
            toString(s1, cs1) |> Ok
        } catch {
            case ex: ##java.lang.Exception =>
                import java.lang.Throwable.getMessage(): String \ {};
                Err(getMessage(ex))
        }

}
