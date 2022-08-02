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


namespace Interop/System/File {

    pub enum BOM(##org.apache.commons.io.ByteOrderMark)

    instance Eq[BOM] {
        pub def eq(x: BOM, y: BOM): Bool = Interop/System/File/BOM.equals(x, y)
    }

    instance ToString[BOM] {
        pub def toString(x: BOM): String = Interop/System/File/BOM.toString(x)
    }
    
    instance Hash[BOM] {
        pub def hash(x: BOM): Int32 = Interop/System/File/BOM.hashCode(x)
    }

    instance Interop/Collections.Marshal[BOM] {
        pub def toJavaObject(x: BOM): ##java.lang.Object =
            let BOM(x1) = x;
            x1 as ##java.lang.Object

        pub def fromJavaObject(o: ##java.lang.Object): BOM = 
            BOM(o as ##org.apache.commons.io.ByteOrderMark)
    }

}


namespace Interop/System/File/BOM {
    
    use Interop/System/File.BOM;
    use Interop/System/File.BOM.{BOM};

    pub def utf_8(): BOM = 
        import static get org.apache.commons.io.ByteOrderMark.UTF_8: ##org.apache.commons.io.ByteOrderMark & Pure as get_UTF_8;
        BOM(get_UTF_8())

    pub def utf_16be(): BOM = 
        import static get org.apache.commons.io.ByteOrderMark.UTF_16BE: ##org.apache.commons.io.ByteOrderMark & Pure as get_UTF_16BE;
        BOM(get_UTF_16BE())

    pub def utf_16le(): BOM = 
        import static get org.apache.commons.io.ByteOrderMark.UTF_16LE: ##org.apache.commons.io.ByteOrderMark & Pure as get_UTF_16LE;
        BOM(get_UTF_16LE())

    pub def utf_32be(): BOM = 
        import static get org.apache.commons.io.ByteOrderMark.UTF_32BE: ##org.apache.commons.io.ByteOrderMark & Pure as get_UTF_32BE;
        BOM(get_UTF_32BE())

    pub def utf_32le(): BOM = 
        import static get org.apache.commons.io.ByteOrderMark.UTF_32LE: ##org.apache.commons.io.ByteOrderMark & Pure as get_UTF_32LE;
        BOM(get_UTF_32LE())

    pub def utf_bom(): Char = 
        import static get org.apache.commons.io.ByteOrderMark.UTF_BOM: Char & Pure as get_UTF_BOM;
        get_UTF_BOM()

    pub def equals(x: BOM, y: BOM): Bool =
        import org.apache.commons.io.ByteOrderMark.equals(##java.lang.Object): Bool & Pure;
        let BOM(x1) = x;
        let BOM(y1) = y;
        equals(x1, y1 as ##java.lang.Object)

    pub def toString(bom: BOM): String =
        import org.apache.commons.io.ByteOrderMark.toString(): String & Pure;
        let BOM(bom1) = bom;
        toString(bom1)

    pub def hashCode(bom: BOM): Int32 =
        import org.apache.commons.io.ByteOrderMark.hashCode(): Int32 & Pure;
        let BOM(bom1) = bom;
        hashCode(bom1)

    pub def getCharsetName(bom: BOM): String = 
        import org.apache.commons.io.ByteOrderMark.getCharsetName(): String & Pure;
        let BOM(bom1) = bom;
        getCharsetName(bom1)

    pub def length(bom: BOM): Int32 = 
        import org.apache.commons.io.ByteOrderMark.length(): Int32 & Pure;
        let BOM(bom1) = bom;
        length(bom1)

    pub def getBytes(_: Region[r], bom: BOM): Array[Int8, r] \ Write(r) =
        import org.apache.commons.io.ByteOrderMark.getBytes(): Array[Int8, r] & r;
        let BOM(bom1) = bom;
        getBytes(bom1)


    pub def getAt(ix: Int32, bom: BOM): Int32 =
        import org.apache.commons.io.ByteOrderMark.get(Int32): Int32 & Pure as get1;
        let BOM(bom1) = bom;
        get1(bom1, ix)
        


}
