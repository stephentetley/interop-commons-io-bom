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


namespace Interop/Apache/Commons/IO {

    pub enum ByteOrderMark(##org.apache.commons.io.ByteOrderMark)

    instance Eq[ByteOrderMark] {
        pub def eq(x: ByteOrderMark, y: ByteOrderMark): Bool = Interop/Apache/Commons/IO/ByteOrderMark.equals(x, y)
    }

    instance ToString[ByteOrderMark] {
        pub def toString(x: ByteOrderMark): String = Interop/Apache/Commons/IO/ByteOrderMark.toString(x)
    }
    
    instance Hash[ByteOrderMark] {
        pub def hash(x: ByteOrderMark): Int32 = Interop/Apache/Commons/IO/ByteOrderMark.hashCode(x)
    }

    instance Interop/Collections.Marshal[ByteOrderMark] {
        pub def toJavaObject(x: ByteOrderMark): ##java.lang.Object =
            let ByteOrderMark(x1) = x;
            x1 as ##java.lang.Object

        pub def fromJavaObject(o: ##java.lang.Object): ByteOrderMark = 
            ByteOrderMark(o as ##org.apache.commons.io.ByteOrderMark)
    }

}


namespace Interop/Apache/Commons/IO/ByteOrderMark {
    
    use Interop/Apache/Commons/IO.ByteOrderMark;
    use Interop/Apache/Commons/IO.ByteOrderMark.{ByteOrderMark};

    pub def getHH(bom: ByteOrderMark): ##org.apache.commons.io.ByteOrderMark =
        import org.apache.commons.io.ByteOrderMark.toString(): String & Pure;
        let ByteOrderMark(bom1) = bom;
        bom1


    pub def utf_8(): ByteOrderMark = 
        import static get org.apache.commons.io.ByteOrderMark.UTF_8: ##org.apache.commons.io.ByteOrderMark & Pure as get_UTF_8;
        ByteOrderMark(get_UTF_8())

    pub def utf_16be(): ByteOrderMark = 
        import static get org.apache.commons.io.ByteOrderMark.UTF_16BE: ##org.apache.commons.io.ByteOrderMark & Pure as get_UTF_16BE;
        ByteOrderMark(get_UTF_16BE())

    pub def utf_16le(): ByteOrderMark = 
        import static get org.apache.commons.io.ByteOrderMark.UTF_16LE: ##org.apache.commons.io.ByteOrderMark & Pure as get_UTF_16LE;
        ByteOrderMark(get_UTF_16LE())

    pub def utf_32be(): ByteOrderMark = 
        import static get org.apache.commons.io.ByteOrderMark.UTF_32BE: ##org.apache.commons.io.ByteOrderMark & Pure as get_UTF_32BE;
        ByteOrderMark(get_UTF_32BE())

    pub def utf_32le(): ByteOrderMark = 
        import static get org.apache.commons.io.ByteOrderMark.UTF_32LE: ##org.apache.commons.io.ByteOrderMark & Pure as get_UTF_32LE;
        ByteOrderMark(get_UTF_32LE())

    pub def utf_bom(): Char = 
        import static get org.apache.commons.io.ByteOrderMark.UTF_BOM: Char & Pure as get_UTF_BOM;
        get_UTF_BOM()

    pub def equals(x: ByteOrderMark, y: ByteOrderMark): Bool =
        import org.apache.commons.io.ByteOrderMark.equals(##java.lang.Object): Bool & Pure;
        let ByteOrderMark(x1) = x;
        let ByteOrderMark(y1) = y;
        equals(x1, y1 as ##java.lang.Object)

    pub def toString(bom: ByteOrderMark): String =
        import org.apache.commons.io.ByteOrderMark.toString(): String & Pure;
        let ByteOrderMark(bom1) = bom;
        toString(bom1)

    pub def hashCode(bom: ByteOrderMark): Int32 =
        import org.apache.commons.io.ByteOrderMark.hashCode(): Int32 & Pure;
        let ByteOrderMark(bom1) = bom;
        hashCode(bom1)

    pub def getCharsetName(bom: ByteOrderMark): String = 
        import org.apache.commons.io.ByteOrderMark.getCharsetName(): String & Pure;
        let ByteOrderMark(bom1) = bom;
        getCharsetName(bom1)

    pub def length(bom: ByteOrderMark): Int32 = 
        import org.apache.commons.io.ByteOrderMark.length(): Int32 & Pure;
        let ByteOrderMark(bom1) = bom;
        length(bom1)

    pub def getBytes(_: Region[r], bom: ByteOrderMark): Array[Int8, r] \ Write(r) =
        import org.apache.commons.io.ByteOrderMark.getBytes(): Array[Int8, r] & r;
        let ByteOrderMark(bom1) = bom;
        getBytes(bom1)


    pub def getAt(ix: Int32, bom: ByteOrderMark): Int32 =
        import org.apache.commons.io.ByteOrderMark.get(Int32): Int32 & Pure as get1;
        let ByteOrderMark(bom1) = bom;
        get1(bom1, ix)
        


}
