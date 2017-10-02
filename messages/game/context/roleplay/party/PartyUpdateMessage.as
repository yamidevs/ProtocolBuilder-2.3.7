package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.dofus.network.types.game.context.roleplay.party.PartyMemberInformations;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyUpdateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5575;
       
      
      private var _isInitialized:Boolean = false;
      
      public var memberInformations:PartyMemberInformations;
      
      public function PartyUpdateMessage()
      {
         this.memberInformations = new PartyMemberInformations();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5575;
      }
      
      public function initPartyUpdateMessage(param1:PartyMemberInformations = null) : PartyUpdateMessage
      {
         this.memberInformations = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.memberInformations = new PartyMemberInformations();
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
         this.serializeAs_PartyUpdateMessage(param1);
      }
      
      public function serializeAs_PartyUpdateMessage(param1:IDataOutput) : void
      {
         this.memberInformations.serializeAs_PartyMemberInformations(param1);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyUpdateMessage(param1);
      }
      
      public function deserializeAs_PartyUpdateMessage(param1:IDataInput) : void
      {
         this.memberInformations = new PartyMemberInformations();
         this.memberInformations.deserialize(param1);
      }
   }
}
