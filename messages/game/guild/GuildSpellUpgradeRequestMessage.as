package com.ankamagames.dofus.network.messages.game.guild
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GuildSpellUpgradeRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5699;
       
      
      private var _isInitialized:Boolean = false;
      
      public var spellId:uint = 0;
      
      public function GuildSpellUpgradeRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5699;
      }
      
      public function initGuildSpellUpgradeRequestMessage(param1:uint = 0) : GuildSpellUpgradeRequestMessage
      {
         this.spellId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.spellId = 0;
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
         this.serializeAs_GuildSpellUpgradeRequestMessage(param1);
      }
      
      public function serializeAs_GuildSpellUpgradeRequestMessage(param1:IDataOutput) : void
      {
         if(this.spellId < 0)
         {
            throw new Error("Forbidden value (" + this.spellId + ") on element spellId.");
         }
         param1.writeInt(this.spellId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GuildSpellUpgradeRequestMessage(param1);
      }
      
      public function deserializeAs_GuildSpellUpgradeRequestMessage(param1:IDataInput) : void
      {
         this.spellId = param1.readInt();
         if(this.spellId < 0)
         {
            throw new Error("Forbidden value (" + this.spellId + ") on element of GuildSpellUpgradeRequestMessage.spellId.");
         }
      }
   }
}
