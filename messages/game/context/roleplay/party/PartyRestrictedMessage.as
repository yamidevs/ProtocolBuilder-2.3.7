package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyRestrictedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6175;
       
      
      private var _isInitialized:Boolean = false;
      
      public var restricted:Boolean = false;
      
      public function PartyRestrictedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6175;
      }
      
      public function initPartyRestrictedMessage(param1:Boolean = false) : PartyRestrictedMessage
      {
         this.restricted = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
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
         this.serializeAs_PartyRestrictedMessage(param1);
      }
      
      public function serializeAs_PartyRestrictedMessage(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.restricted);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyRestrictedMessage(param1);
      }
      
      public function deserializeAs_PartyRestrictedMessage(param1:IDataInput) : void
      {
         this.restricted = param1.readBoolean();
      }
   }
}
