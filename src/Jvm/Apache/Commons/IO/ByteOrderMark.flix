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


mod Jvm.Apache.Commons.IO {

    pub type alias ByteOrderMark = Interop.Apache.Commons.IO.ByteOrderMark

}


mod Jvm.Apache.Commons.IO.ByteOrderMark {
    
    use Jvm.Apache.Commons.IO.ByteOrderMark;
    use Interop.Apache.Commons.IO.ByteOrderMark.{ByteOrderMark};


    pub def utf_8(): ByteOrderMark = 
        Interop.Apache.Commons.IO.ByteOrderMark.utf_8()

    pub def utf_16be(): ByteOrderMark = 
        Interop.Apache.Commons.IO.ByteOrderMark.utf_16be()

    pub def utf_16le(): ByteOrderMark = 
        Interop.Apache.Commons.IO.ByteOrderMark.utf_16le()

    pub def utf_32be(): ByteOrderMark = 
        Interop.Apache.Commons.IO.ByteOrderMark.utf_32be()

    pub def utf_32le(): ByteOrderMark = 
        Interop.Apache.Commons.IO.ByteOrderMark.utf_32le()

    pub def utf_bom(): Char = 
        Interop.Apache.Commons.IO.ByteOrderMark.utf_bom()

    pub def equals(x: ByteOrderMark, y: ByteOrderMark): Bool =
        Interop.Apache.Commons.IO.ByteOrderMark.equals(x, y)

    pub def toString(bom: ByteOrderMark): String =
        Interop.Apache.Commons.IO.ByteOrderMark.toString(bom)


    pub def getCharsetName(bom: ByteOrderMark): String = 
        Interop.Apache.Commons.IO.ByteOrderMark.getCharsetName(bom)

    pub def length(bom: ByteOrderMark): Int32 = 
        Interop.Apache.Commons.IO.ByteOrderMark.length(bom)

    pub def getBytes(r: Region[r], bom: ByteOrderMark): Array[Int8, r] \ Write(r) =
        Interop.Apache.Commons.IO.ByteOrderMark.getBytes(r, bom)


    pub def getAt(ix: Int32, bom: ByteOrderMark): Int32 =
        Interop.Apache.Commons.IO.ByteOrderMark.getAt(ix, bom)


}
