package com.ankamagames.dofus.network.messages.game.actions.fight
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameActionFightSpellCastMessage extends AbstractGameActionFightTargetedAbilityMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 1010;
       
      
      private var _isInitialized:Boolean = false;
      
      public var spellId:uint = 0;
      
      public var spellLevel:uint = 0;
      
      public function GameActionFightSpellCastMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 1010;
      }
      
      public function initGameActionFightSpellCastMessage(param1:uint = 0, param2:int = 0, param3:int = 0, param4:uint = 1, param5:Boolean = false, param6:uint = 0, param7:uint = 0) : GameActionFightSpellCastMessage
      {
         super.initAbstractGameActionFightTargetedAbilityMessage(param1,param2,param3,param4,param5);
         this.spellId = param6;
         this.spellLevel = param7;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.spellId = 0;
         this.spellLevel = 0;
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
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_GameActionFightSpellCastMessage(param1);
      }
      
      public function serializeAs_GameActionFightSpellCastMessage(param1:IDataOutput) : void
      {
         super.serializeAs_AbstractGameActionFightTargetedAbilityMessage(param1);
         if(this.spellId < 0)
         {
            throw new Error("Forbidden value (" + this.spellId + ") on element spellId.");
         }
         param1.writeShort(this.spellId);
         if(this.spellLevel < 1 || this.spellLevel > 6)
         {
            throw new Error("Forbidden value (" + this.spellLevel + ") on element spellLevel.");
         }
         param1.writeByte(this.spellLevel);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameActionFightSpellCastMessage(param1);
      }
      
      public function deserializeAs_GameActionFightSpellCastMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.spellId = param1.readShort();
         if(this.spellId < 0)
         {
            throw new Error("Forbidden value (" + this.spellId + ") on element of GameActionFightSpellCastMessage.spellId.");
         }
         this.spellLevel = param1.readByte();
         if(this.spellLevel < 1 || this.spellLevel > 6)
         {
            throw new Error("Forbidden value (" + this.spellLevel + ") on element of GameActionFightSpellCastMessage.spellLevel.");
         }
      }
   }
}
