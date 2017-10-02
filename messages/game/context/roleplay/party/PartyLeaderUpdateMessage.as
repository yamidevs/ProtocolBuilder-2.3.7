package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyLeaderUpdateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5578;
       
      
      private var _isInitialized:Boolean = false;
      
      public var partyLeaderId:uint = 0;
      
      public function PartyLeaderUpdateMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5578;
      }
      
      public function initPartyLeaderUpdateMessage(param1:uint = 0) : PartyLeaderUpdateMessage
      {
         this.partyLeaderId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.partyLeaderId = 0;
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
         this.serializeAs_PartyLeaderUpdateMessage(param1);
      }
      
      public function serializeAs_PartyLeaderUpdateMessage(param1:IDataOutput) : void
      {
         if(this.partyLeaderId < 0)
         {
            throw new Error("Forbidden value (" + this.partyLeaderId + ") on element partyLeaderId.");
         }
         param1.writeInt(this.partyLeaderId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyLeaderUpdateMessage(param1);
      }
      
      public function deserializeAs_PartyLeaderUpdateMessage(param1:IDataInput) : void
      {
         this.partyLeaderId = param1.readInt();
         if(this.partyLeaderId < 0)
         {
            throw new Error("Forbidden value (" + this.partyLeaderId + ") on element of PartyLeaderUpdateMessage.partyLeaderId.");
         }
      }
   }
}
