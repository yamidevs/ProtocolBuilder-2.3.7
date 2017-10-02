package com.ankamagames.dofus.network.messages.game.context.roleplay.fight
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameRolePlayPlayerFightRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5731;
       
      
      private var _isInitialized:Boolean = false;
      
      public var targetId:uint = 0;
      
      public var targetCellId:int = 0;
      
      public var friendly:Boolean = false;
      
      public function GameRolePlayPlayerFightRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5731;
      }
      
      public function initGameRolePlayPlayerFightRequestMessage(param1:uint = 0, param2:int = 0, param3:Boolean = false) : GameRolePlayPlayerFightRequestMessage
      {
         this.targetId = param1;
         this.targetCellId = param2;
         this.friendly = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.targetId = 0;
         this.targetCellId = 0;
         this.friendly = false;
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
         this.serializeAs_GameRolePlayPlayerFightRequestMessage(param1);
      }
      
      public function serializeAs_GameRolePlayPlayerFightRequestMessage(param1:IDataOutput) : void
      {
         if(this.targetId < 0)
         {
            throw new Error("Forbidden value (" + this.targetId + ") on element targetId.");
         }
         param1.writeInt(this.targetId);
         if(this.targetCellId < -1 || this.targetCellId > 559)
         {
            throw new Error("Forbidden value (" + this.targetCellId + ") on element targetCellId.");
         }
         param1.writeShort(this.targetCellId);
         param1.writeBoolean(this.friendly);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameRolePlayPlayerFightRequestMessage(param1);
      }
      
      public function deserializeAs_GameRolePlayPlayerFightRequestMessage(param1:IDataInput) : void
      {
         this.targetId = param1.readInt();
         if(this.targetId < 0)
         {
            throw new Error("Forbidden value (" + this.targetId + ") on element of GameRolePlayPlayerFightRequestMessage.targetId.");
         }
         this.targetCellId = param1.readShort();
         if(this.targetCellId < -1 || this.targetCellId > 559)
         {
            throw new Error("Forbidden value (" + this.targetCellId + ") on element of GameRolePlayPlayerFightRequestMessage.targetCellId.");
         }
         this.friendly = param1.readBoolean();
      }
   }
}
