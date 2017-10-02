package com.ankamagames.dofus.network.messages.game.context.roleplay.visual
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameRolePlaySpellAnimMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6114;
       
      
      private var _isInitialized:Boolean = false;
      
      public var casterId:int = 0;
      
      public var targetCellId:uint = 0;
      
      public var spellId:uint = 0;
      
      public var spellLevel:uint = 0;
      
      public function GameRolePlaySpellAnimMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6114;
      }
      
      public function initGameRolePlaySpellAnimMessage(param1:int = 0, param2:uint = 0, param3:uint = 0, param4:uint = 0) : GameRolePlaySpellAnimMessage
      {
         this.casterId = param1;
         this.targetCellId = param2;
         this.spellId = param3;
         this.spellLevel = param4;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.casterId = 0;
         this.targetCellId = 0;
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
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_GameRolePlaySpellAnimMessage(param1);
      }
      
      public function serializeAs_GameRolePlaySpellAnimMessage(param1:IDataOutput) : void
      {
         param1.writeInt(this.casterId);
         if(this.targetCellId < 0 || this.targetCellId > 559)
         {
            throw new Error("Forbidden value (" + this.targetCellId + ") on element targetCellId.");
         }
         param1.writeShort(this.targetCellId);
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
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameRolePlaySpellAnimMessage(param1);
      }
      
      public function deserializeAs_GameRolePlaySpellAnimMessage(param1:IDataInput) : void
      {
         this.casterId = param1.readInt();
         this.targetCellId = param1.readShort();
         if(this.targetCellId < 0 || this.targetCellId > 559)
         {
            throw new Error("Forbidden value (" + this.targetCellId + ") on element of GameRolePlaySpellAnimMessage.targetCellId.");
         }
         this.spellId = param1.readShort();
         if(this.spellId < 0)
         {
            throw new Error("Forbidden value (" + this.spellId + ") on element of GameRolePlaySpellAnimMessage.spellId.");
         }
         this.spellLevel = param1.readByte();
         if(this.spellLevel < 1 || this.spellLevel > 6)
         {
            throw new Error("Forbidden value (" + this.spellLevel + ") on element of GameRolePlaySpellAnimMessage.spellLevel.");
         }
      }
   }
}
