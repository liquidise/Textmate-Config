package flash.utils {
public interface IDataInput {
	function get bytesAvailable():uint;
	function get endian():String;
	function set endian(value:String):void;
	function get objectEncoding():uint;
	function set objectEncoding(value:uint):void;
	function readBoolean():Boolean;
	function readByte():int;
	function readBytes(bytes:ByteArray, offset:uint = 0, length:uint = 0):void;
	function readDouble():Number;
	function readFloat():Number;
	function readInt():int;
	function readMultiByte(length:uint, charSet:String):String;
	function readObject():*;
	function readShort():int;
	function readUnsignedByte():uint;
	function readUnsignedInt():uint;
	function readUnsignedShort():uint;
	function readUTF():String;
	function readUTFBytes(length:uint):String;
}
}
