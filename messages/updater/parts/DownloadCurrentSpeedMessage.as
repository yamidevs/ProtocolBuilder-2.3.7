package com.ankamagames.dofus.network.messages.updater.parts
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class DownloadCurrentSpeedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 1511;
       
      
      private var _isInitialized:Boolean = false;
      
      public var downloadSpeed:uint = 0;
      
      public function DownloadCurrentSpeedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 1511;
      }
      
      public function initDownloadCurrentSpeedMessage(param1:uint = 0) : DownloadCurrentSpeedMessage
      {
         this.downloadSpeed = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.downloadSpeed = 0;
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
         this.serializeAs_DownloadCurrentSpeedMessage(param1);
      }
      
      public function serializeAs_DownloadCurrentSpeedMessage(param1:IDataOutput) : void
      {
         if(this.downloadSpeed < 1 || this.downloadSpeed > 10)
         {
            throw new Error("Forbidden value (" + this.downloadSpeed + ") on element downloadSpeed.");
         }
         param1.writeByte(this.downloadSpeed);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_DownloadCurrentSpeedMessage(param1);
      }
      
      public function deserializeAs_DownloadCurrentSpeedMessage(param1:IDataInput) : void
      {
         this.downloadSpeed = param1.readByte();
         if(this.downloadSpeed < 1 || this.downloadSpeed > 10)
         {
            throw new Error("Forbidden value (" + this.downloadSpeed + ") on element of DownloadCurrentSpeedMessage.downloadSpeed.");
         }
      }
   }
}