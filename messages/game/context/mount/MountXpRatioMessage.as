package com.ankamagames.dofus.network.messages.game.context.mount
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class MountXpRatioMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5970;
       
      
      private var _isInitialized:Boolean = false;
      
      public var ratio:uint = 0;
      
      public function MountXpRatioMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5970;
      }
      
      public function initMountXpRatioMessage(param1:uint = 0) : MountXpRatioMessage
      {
         this.ratio = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.ratio = 0;
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
         this.serializeAs_MountXpRatioMessage(param1);
      }
      
      public function serializeAs_MountXpRatioMessage(param1:IDataOutput) : void
      {
         if(this.ratio < 0)
         {
            throw new Error("Forbidden value (" + this.ratio + ") on element ratio.");
         }
         param1.writeByte(this.ratio);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_MountXpRatioMessage(param1);
      }
      
      public function deserializeAs_MountXpRatioMessage(param1:IDataInput) : void
      {
         this.ratio = param1.readByte();
         if(this.ratio < 0)
         {
            throw new Error("Forbidden value (" + this.ratio + ") on element of MountXpRatioMessage.ratio.");
         }
      }
   }
}
