package com.ankamagames.dofus.network.messages.game.pvp
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PVPActivationCostMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 1801;
       
      
      private var _isInitialized:Boolean = false;
      
      public var cost:uint = 0;
      
      public function PVPActivationCostMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 1801;
      }
      
      public function initPVPActivationCostMessage(param1:uint = 0) : PVPActivationCostMessage
      {
         this.cost = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.cost = 0;
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
         this.serializeAs_PVPActivationCostMessage(param1);
      }
      
      public function serializeAs_PVPActivationCostMessage(param1:IDataOutput) : void
      {
         if(this.cost < 0)
         {
            throw new Error("Forbidden value (" + this.cost + ") on element cost.");
         }
         param1.writeShort(this.cost);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PVPActivationCostMessage(param1);
      }
      
      public function deserializeAs_PVPActivationCostMessage(param1:IDataInput) : void
      {
         this.cost = param1.readShort();
         if(this.cost < 0)
         {
            throw new Error("Forbidden value (" + this.cost + ") on element of PVPActivationCostMessage.cost.");
         }
      }
   }
}
