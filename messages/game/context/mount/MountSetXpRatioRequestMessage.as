package com.ankamagames.dofus.network.messages.game.context.mount
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class MountSetXpRatioRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5989;
       
      
      private var _isInitialized:Boolean = false;
      
      public var xpRatio:uint = 0;
      
      public function MountSetXpRatioRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5989;
      }
      
      public function initMountSetXpRatioRequestMessage(param1:uint = 0) : MountSetXpRatioRequestMessage
      {
         this.xpRatio = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.xpRatio = 0;
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
         this.serializeAs_MountSetXpRatioRequestMessage(param1);
      }
      
      public function serializeAs_MountSetXpRatioRequestMessage(param1:IDataOutput) : void
      {
         if(this.xpRatio < 0)
         {
            throw new Error("Forbidden value (" + this.xpRatio + ") on element xpRatio.");
         }
         param1.writeByte(this.xpRatio);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_MountSetXpRatioRequestMessage(param1);
      }
      
      public function deserializeAs_MountSetXpRatioRequestMessage(param1:IDataInput) : void
      {
         this.xpRatio = param1.readByte();
         if(this.xpRatio < 0)
         {
            throw new Error("Forbidden value (" + this.xpRatio + ") on element of MountSetXpRatioRequestMessage.xpRatio.");
         }
      }
   }
}
