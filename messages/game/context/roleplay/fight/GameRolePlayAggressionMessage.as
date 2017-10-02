package com.ankamagames.dofus.network.messages.game.context.roleplay.fight
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameRolePlayAggressionMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6073;
       
      
      private var _isInitialized:Boolean = false;
      
      public var attackerId:uint = 0;
      
      public var defenderId:uint = 0;
      
      public function GameRolePlayAggressionMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6073;
      }
      
      public function initGameRolePlayAggressionMessage(param1:uint = 0, param2:uint = 0) : GameRolePlayAggressionMessage
      {
         this.attackerId = param1;
         this.defenderId = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.attackerId = 0;
         this.defenderId = 0;
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
         this.serializeAs_GameRolePlayAggressionMessage(param1);
      }
      
      public function serializeAs_GameRolePlayAggressionMessage(param1:IDataOutput) : void
      {
         if(this.attackerId < 0)
         {
            throw new Error("Forbidden value (" + this.attackerId + ") on element attackerId.");
         }
         param1.writeInt(this.attackerId);
         if(this.defenderId < 0)
         {
            throw new Error("Forbidden value (" + this.defenderId + ") on element defenderId.");
         }
         param1.writeInt(this.defenderId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameRolePlayAggressionMessage(param1);
      }
      
      public function deserializeAs_GameRolePlayAggressionMessage(param1:IDataInput) : void
      {
         this.attackerId = param1.readInt();
         if(this.attackerId < 0)
         {
            throw new Error("Forbidden value (" + this.attackerId + ") on element of GameRolePlayAggressionMessage.attackerId.");
         }
         this.defenderId = param1.readInt();
         if(this.defenderId < 0)
         {
            throw new Error("Forbidden value (" + this.defenderId + ") on element of GameRolePlayAggressionMessage.defenderId.");
         }
      }
   }
}
