package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyKickRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5592;
       
      
      private var _isInitialized:Boolean = false;
      
      public var playerId:uint = 0;
      
      public function PartyKickRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5592;
      }
      
      public function initPartyKickRequestMessage(param1:uint = 0) : PartyKickRequestMessage
      {
         this.playerId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.playerId = 0;
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
         this.serializeAs_PartyKickRequestMessage(param1);
      }
      
      public function serializeAs_PartyKickRequestMessage(param1:IDataOutput) : void
      {
         if(this.playerId < 0)
         {
            throw new Error("Forbidden value (" + this.playerId + ") on element playerId.");
         }
         param1.writeInt(this.playerId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyKickRequestMessage(param1);
      }
      
      public function deserializeAs_PartyKickRequestMessage(param1:IDataInput) : void
      {
         this.playerId = param1.readInt();
         if(this.playerId < 0)
         {
            throw new Error("Forbidden value (" + this.playerId + ") on element of PartyKickRequestMessage.playerId.");
         }
      }
   }
}
