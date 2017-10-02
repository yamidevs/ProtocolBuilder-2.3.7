package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PrismFightSwapRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5901;
       
      
      private var _isInitialized:Boolean = false;
      
      public var targetId:uint = 0;
      
      public function PrismFightSwapRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5901;
      }
      
      public function initPrismFightSwapRequestMessage(param1:uint = 0) : PrismFightSwapRequestMessage
      {
         this.targetId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.targetId = 0;
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
         this.serializeAs_PrismFightSwapRequestMessage(param1);
      }
      
      public function serializeAs_PrismFightSwapRequestMessage(param1:IDataOutput) : void
      {
         if(this.targetId < 0)
         {
            throw new Error("Forbidden value (" + this.targetId + ") on element targetId.");
         }
         param1.writeInt(this.targetId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismFightSwapRequestMessage(param1);
      }
      
      public function deserializeAs_PrismFightSwapRequestMessage(param1:IDataInput) : void
      {
         this.targetId = param1.readInt();
         if(this.targetId < 0)
         {
            throw new Error("Forbidden value (" + this.targetId + ") on element of PrismFightSwapRequestMessage.targetId.");
         }
      }
   }
}
