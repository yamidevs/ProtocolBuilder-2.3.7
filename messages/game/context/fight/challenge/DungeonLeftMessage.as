package com.ankamagames.dofus.network.messages.game.context.fight.challenge
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class DungeonLeftMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6149;
       
      
      private var _isInitialized:Boolean = false;
      
      public var dungeonId:uint = 0;
      
      public function DungeonLeftMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6149;
      }
      
      public function initDungeonLeftMessage(param1:uint = 0) : DungeonLeftMessage
      {
         this.dungeonId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.dungeonId = 0;
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
         this.serializeAs_DungeonLeftMessage(param1);
      }
      
      public function serializeAs_DungeonLeftMessage(param1:IDataOutput) : void
      {
         if(this.dungeonId < 0)
         {
            throw new Error("Forbidden value (" + this.dungeonId + ") on element dungeonId.");
         }
         param1.writeInt(this.dungeonId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_DungeonLeftMessage(param1);
      }
      
      public function deserializeAs_DungeonLeftMessage(param1:IDataInput) : void
      {
         this.dungeonId = param1.readInt();
         if(this.dungeonId < 0)
         {
            throw new Error("Forbidden value (" + this.dungeonId + ") on element of DungeonLeftMessage.dungeonId.");
         }
      }
   }
}
