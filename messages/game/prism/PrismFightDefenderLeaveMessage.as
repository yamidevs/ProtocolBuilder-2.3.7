package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PrismFightDefenderLeaveMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5892;
       
      
      private var _isInitialized:Boolean = false;
      
      public var fightId:Number = 0;
      
      public var fighterToRemoveId:uint = 0;
      
      public var successor:uint = 0;
      
      public function PrismFightDefenderLeaveMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5892;
      }
      
      public function initPrismFightDefenderLeaveMessage(param1:Number = 0, param2:uint = 0, param3:uint = 0) : PrismFightDefenderLeaveMessage
      {
         this.fightId = param1;
         this.fighterToRemoveId = param2;
         this.successor = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.fightId = 0;
         this.fighterToRemoveId = 0;
         this.successor = 0;
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
         this.serializeAs_PrismFightDefenderLeaveMessage(param1);
      }
      
      public function serializeAs_PrismFightDefenderLeaveMessage(param1:IDataOutput) : void
      {
         param1.writeDouble(this.fightId);
         if(this.fighterToRemoveId < 0)
         {
            throw new Error("Forbidden value (" + this.fighterToRemoveId + ") on element fighterToRemoveId.");
         }
         param1.writeInt(this.fighterToRemoveId);
         if(this.successor < 0)
         {
            throw new Error("Forbidden value (" + this.successor + ") on element successor.");
         }
         param1.writeInt(this.successor);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismFightDefenderLeaveMessage(param1);
      }
      
      public function deserializeAs_PrismFightDefenderLeaveMessage(param1:IDataInput) : void
      {
         this.fightId = param1.readDouble();
         this.fighterToRemoveId = param1.readInt();
         if(this.fighterToRemoveId < 0)
         {
            throw new Error("Forbidden value (" + this.fighterToRemoveId + ") on element of PrismFightDefenderLeaveMessage.fighterToRemoveId.");
         }
         this.successor = param1.readInt();
         if(this.successor < 0)
         {
            throw new Error("Forbidden value (" + this.successor + ") on element of PrismFightDefenderLeaveMessage.successor.");
         }
      }
   }
}
