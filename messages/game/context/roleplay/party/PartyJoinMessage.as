package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.dofus.network.types.game.context.roleplay.party.PartyGuestInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.party.PartyMemberInformations;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class PartyJoinMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5576;
       
      
      private var _isInitialized:Boolean = false;
      
      public var partyId:uint = 0;
      
      public var partyLeaderId:uint = 0;
      
      public var members:Vector.<PartyMemberInformations>;
      
      public var guests:Vector.<PartyGuestInformations>;
      
      public var restricted:Boolean = false;
      
      public function PartyJoinMessage()
      {
         this.members = new Vector.<PartyMemberInformations>();
         this.guests = new Vector.<PartyGuestInformations>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5576;
      }
      
      public function initPartyJoinMessage(param1:uint = 0, param2:uint = 0, param3:Vector.<PartyMemberInformations> = null, param4:Vector.<PartyGuestInformations> = null, param5:Boolean = false) : PartyJoinMessage
      {
         this.partyId = param1;
         this.partyLeaderId = param2;
         this.members = param3;
         this.guests = param4;
         this.restricted = param5;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.partyId = 0;
         this.partyLeaderId = 0;
         this.members = new Vector.<PartyMemberInformations>();
         this.guests = new Vector.<PartyGuestInformations>();
         this.restricted = false;
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
         this.serializeAs_PartyJoinMessage(param1);
      }
      
      public function serializeAs_PartyJoinMessage(param1:IDataOutput) : void
      {
         if(this.partyId < 0)
         {
            throw new Error("Forbidden value (" + this.partyId + ") on element partyId.");
         }
         param1.writeInt(this.partyId);
         if(this.partyLeaderId < 0)
         {
            throw new Error("Forbidden value (" + this.partyLeaderId + ") on element partyLeaderId.");
         }
         param1.writeInt(this.partyLeaderId);
         param1.writeShort(this.members.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.members.length)
         {
            (this.members[_loc2_] as PartyMemberInformations).serializeAs_PartyMemberInformations(param1);
            _loc2_++;
         }
         param1.writeShort(this.guests.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.guests.length)
         {
            (this.guests[_loc3_] as PartyGuestInformations).serializeAs_PartyGuestInformations(param1);
            _loc3_++;
         }
         param1.writeBoolean(this.restricted);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyJoinMessage(param1);
      }
      
      public function deserializeAs_PartyJoinMessage(param1:IDataInput) : void
      {
         var _loc6_:PartyMemberInformations = null;
         var _loc7_:PartyGuestInformations = null;
         this.partyId = param1.readInt();
         if(this.partyId < 0)
         {
            throw new Error("Forbidden value (" + this.partyId + ") on element of PartyJoinMessage.partyId.");
         }
         this.partyLeaderId = param1.readInt();
         if(this.partyLeaderId < 0)
         {
            throw new Error("Forbidden value (" + this.partyLeaderId + ") on element of PartyJoinMessage.partyLeaderId.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = new PartyMemberInformations();
            _loc6_.deserialize(param1);
            this.members.push(_loc6_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = new PartyGuestInformations();
            _loc7_.deserialize(param1);
            this.guests.push(_loc7_);
            _loc5_++;
         }
         this.restricted = param1.readBoolean();
      }
   }
}
