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

mod TestByteOrderMark {

    @test
    def getCharsetName01(): Unit \ IO =
        let name = Apache.Commons.IO.ByteOrderMark.utf_8() |> Apache.Commons.IO.ByteOrderMark.getCharsetName;
        println("getCharsetName01: ${name}")

    @test
    def length01(): Unit \ IO =
        let len = Apache.Commons.IO.ByteOrderMark.utf_8() |> Apache.Commons.IO.ByteOrderMark.length;
        println("length01: ${len}")
    
    @test
    def length02(): Unit \ IO =
        let len = Apache.Commons.IO.ByteOrderMark.utf_16le() |> Apache.Commons.IO.ByteOrderMark.length;
        println("length02: ${len}")

    @test
    def toString01(): Unit \ IO =
        let bom = Apache.Commons.IO.ByteOrderMark.utf_16le() |> Apache.Commons.IO.ByteOrderMark.toString;
        println("toString01: ${bom}")

}
