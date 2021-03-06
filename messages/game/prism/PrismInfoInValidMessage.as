package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PrismInfoInValidMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5859;
       
      
      private var _isInitialized:Boolean = false;
      
      public var reason:uint = 0;
      
      public function PrismInfoInValidMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5859;
      }
      
      public function initPrismInfoInValidMessage(param1:uint = 0) : PrismInfoInValidMessage
      {
         this.reason = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.reason = 0;
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
         this.serializeAs_PrismInfoInValidMessage(param1);
      }
      
      public function serializeAs_PrismInfoInValidMessage(param1:IDataOutput) : void
      {
         param1.writeByte(this.reason);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismInfoInValidMessage(param1);
      }
      
      public function deserializeAs_PrismInfoInValidMessage(param1:IDataInput) : void
      {
         this.reason = param1.readByte();
         if(this.reason < 0)
         {
            throw new Error("Forbidden value (" + this.reason + ") on element of PrismInfoInValidMessage.reason.");
         }
      }
   }
}
