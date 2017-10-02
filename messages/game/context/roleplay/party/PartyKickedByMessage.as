package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyKickedByMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5590;
       
      
      private var _isInitialized:Boolean = false;
      
      public var kickerId:uint = 0;
      
      public function PartyKickedByMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5590;
      }
      
      public function initPartyKickedByMessage(param1:uint = 0) : PartyKickedByMessage
      {
         this.kickerId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.kickerId = 0;
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
         this.serializeAs_PartyKickedByMessage(param1);
      }
      
      public function serializeAs_PartyKickedByMessage(param1:IDataOutput) : void
      {
         if(this.kickerId < 0)
         {
            throw new Error("Forbidden value (" + this.kickerId + ") on element kickerId.");
         }
         param1.writeInt(this.kickerId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyKickedByMessage(param1);
      }
      
      public function deserializeAs_PartyKickedByMessage(param1:IDataInput) : void
      {
         this.kickerId = param1.readInt();
         if(this.kickerId < 0)
         {
            throw new Error("Forbidden value (" + this.kickerId + ") on element of PartyKickedByMessage.kickerId.");
         }
      }
   }
}
