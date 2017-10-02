package com.ankamagames.dofus.network.messages.game.context.mount
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PaddockSellRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5953;
       
      
      private var _isInitialized:Boolean = false;
      
      public var price:uint = 0;
      
      public function PaddockSellRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5953;
      }
      
      public function initPaddockSellRequestMessage(param1:uint = 0) : PaddockSellRequestMessage
      {
         this.price = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.price = 0;
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
         this.serializeAs_PaddockSellRequestMessage(param1);
      }
      
      public function serializeAs_PaddockSellRequestMessage(param1:IDataOutput) : void
      {
         if(this.price < 0)
         {
            throw new Error("Forbidden value (" + this.price + ") on element price.");
         }
         param1.writeInt(this.price);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PaddockSellRequestMessage(param1);
      }
      
      public function deserializeAs_PaddockSellRequestMessage(param1:IDataInput) : void
      {
         this.price = param1.readInt();
         if(this.price < 0)
         {
            throw new Error("Forbidden value (" + this.price + ") on element of PaddockSellRequestMessage.price.");
         }
      }
   }
}
