package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.dofus.network.types.game.context.roleplay.party.PartyMemberGeoPosition;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyLocateMembersMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5595;
       
      
      private var _isInitialized:Boolean = false;
      
      public var geopositions:Vector.<PartyMemberGeoPosition>;
      
      public function PartyLocateMembersMessage()
      {
         this.geopositions = new Vector.<PartyMemberGeoPosition>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5595;
      }
      
      public function initPartyLocateMembersMessage(param1:Vector.<PartyMemberGeoPosition> = null) : PartyLocateMembersMessage
      {
         this.geopositions = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.geopositions = new Vector.<PartyMemberGeoPosition>();
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
         this.serializeAs_PartyLocateMembersMessage(param1);
      }
      
      public function serializeAs_PartyLocateMembersMessage(param1:IDataOutput) : void
      {
         param1.writeShort(this.geopositions.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.geopositions.length)
         {
            (this.geopositions[_loc2_] as PartyMemberGeoPosition).serializeAs_PartyMemberGeoPosition(param1);
            _loc2_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyLocateMembersMessage(param1);
      }
      
      public function deserializeAs_PartyLocateMembersMessage(param1:IDataInput) : void
      {
         var _loc4_:PartyMemberGeoPosition = null;
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new PartyMemberGeoPosition();
            _loc4_.deserialize(param1);
            this.geopositions.push(_loc4_);
            _loc3_++;
         }
      }
   }
}
