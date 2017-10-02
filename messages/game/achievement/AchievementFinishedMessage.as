package com.ankamagames.dofus.network.messages.game.achievement
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class AchievementFinishedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6208;
       
      
      private var _isInitialized:Boolean = false;
      
      public var achievementId:uint = 0;
      
      public function AchievementFinishedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6208;
      }
      
      public function initAchievementFinishedMessage(param1:uint = 0) : AchievementFinishedMessage
      {
         this.achievementId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.achievementId = 0;
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
         this.serializeAs_AchievementFinishedMessage(param1);
      }
      
      public function serializeAs_AchievementFinishedMessage(param1:IDataOutput) : void
      {
         if(this.achievementId < 0)
         {
            throw new Error("Forbidden value (" + this.achievementId + ") on element achievementId.");
         }
         param1.writeShort(this.achievementId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_AchievementFinishedMessage(param1);
      }
      
      public function deserializeAs_AchievementFinishedMessage(param1:IDataInput) : void
      {
         this.achievementId = param1.readShort();
         if(this.achievementId < 0)
         {
            throw new Error("Forbidden value (" + this.achievementId + ") on element of AchievementFinishedMessage.achievementId.");
         }
      }
   }
}
