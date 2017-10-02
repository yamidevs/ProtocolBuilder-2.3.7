package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyAcceptInvitationMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5580;
       
      
      private var _isInitialized:Boolean = false;
      
      public var partyId:uint = 0;
      
      public function PartyAcceptInvitationMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5580;
      }
      
      public function initPartyAcceptInvitationMessage(param1:uint = 0) : PartyAcceptInvitationMessage
      {
         this.partyId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.partyId = 0;
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
         this.serializeAs_PartyAcceptInvitationMessage(param1);
      }
      
      public function serializeAs_PartyAcceptInvitationMessage(param1:IDataOutput) : void
      {
         if(this.partyId < 0)
         {
            throw new Error("Forbidden value (" + this.partyId + ") on element partyId.");
         }
         param1.writeInt(this.partyId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyAcceptInvitationMessage(param1);
      }
      
      public function deserializeAs_PartyAcceptInvitationMessage(param1:IDataInput) : void
      {
         this.partyId = param1.readInt();
         if(this.partyId < 0)
         {
            throw new Error("Forbidden value (" + this.partyId + ") on element of PartyAcceptInvitationMessage.partyId.");
         }
      }
   }
}
