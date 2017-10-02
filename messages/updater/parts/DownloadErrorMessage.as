package com.ankamagames.dofus.network.messages.updater.parts
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class DownloadErrorMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 1513;
       
      
      private var _isInitialized:Boolean = false;
      
      public var errorId:uint = 0;
      
      public var message:String = "";
      
      public var helpUrl:String = "";
      
      public function DownloadErrorMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 1513;
      }
      
      public function initDownloadErrorMessage(param1:uint = 0, param2:String = "", param3:String = "") : DownloadErrorMessage
      {
         this.errorId = param1;
         this.message = param2;
         this.helpUrl = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.errorId = 0;
         this.message = "";
         this.helpUrl = "";
         this._isInitialized = false;
      }
      
      override public function pack(param1:IDataOutput) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         this.serialize(_loc2_);
         writePacket(param1,this.getMessageId(),_loc2_);
      }
      
      override public function unpack(param1:IDataInput, param2:uint) : void
      {
         this.deserialize(param1);
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_DownloadErrorMessage(param1);
      }
      
      public function serializeAs_DownloadErrorMessage(param1:IDataOutput) : void
      {
         param1.writeByte(this.errorId);
         param1.writeUTF(this.message);
         param1.writeUTF(this.helpUrl);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_DownloadErrorMessage(param1);
      }
      
      public function deserializeAs_DownloadErrorMessage(param1:IDataInput) : void
      {
         this.errorId = param1.readByte();
         if(this.errorId < 0)
         {
            throw new Error("Forbidden value (" + this.errorId + ") on element of DownloadErrorMessage.errorId.");
         }
         this.message = param1.readUTF();
         this.helpUrl = param1.readUTF();
      }
   }
}
