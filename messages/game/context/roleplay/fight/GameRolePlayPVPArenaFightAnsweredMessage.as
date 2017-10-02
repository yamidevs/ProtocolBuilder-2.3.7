package com.ankamagames.dofus.network.messages.game.context.roleplay.fight
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameRolePlayPVPArenaFightAnsweredMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6255;
       
      
      private var _isInitialized:Boolean = false;
      
      public var fightId:int = 0;
      
      public var targetId:uint = 0;
      
      public function GameRolePlayPVPArenaFightAnsweredMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6255;
      }
      
      public function initGameRolePlayPVPArenaFightAnsweredMessage(param1:int = 0, param2:uint = 0) : GameRolePlayPVPArenaFightAnsweredMessage
      {
         this.fightId = param1;
         this.targetId = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.fightId = 0;
         this.targetId = 0;
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
         this.serializeAs_GameRolePlayPVPArenaFightAnsweredMessage(param1);
      }
      
      public function serializeAs_GameRolePlayPVPArenaFightAnsweredMessage(param1:IDataOutput) : void
      {
         param1.writeInt(this.fightId);
         if(this.targetId < 0)
         {
            throw new Error("Forbidden value (" + this.targetId + ") on element targetId.");
         }
         param1.writeInt(this.targetId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameRolePlayPVPArenaFightAnsweredMessage(param1);
      }
      
      public function deserializeAs_GameRolePlayPVPArenaFightAnsweredMessage(param1:IDataInput) : void
      {
         this.fightId = param1.readInt();
         this.targetId = param1.readInt();
         if(this.targetId < 0)
         {
            throw new Error("Forbidden value (" + this.targetId + ") on element of GameRolePlayPVPArenaFightAnsweredMessage.targetId.");
         }
      }
   }
}
