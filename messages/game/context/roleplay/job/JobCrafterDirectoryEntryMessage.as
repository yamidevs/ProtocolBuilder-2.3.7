package com.ankamagames.dofus.network.messages.game.context.roleplay.job
{
   import com.ankamagames.dofus.network.types.game.context.roleplay.job.JobCrafterDirectoryEntryJobInfo;
   import com.ankamagames.dofus.network.types.game.context.roleplay.job.JobCrafterDirectoryEntryPlayerInfo;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class JobCrafterDirectoryEntryMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6044;
       
      
      private var _isInitialized:Boolean = false;
      
      public var playerInfo:JobCrafterDirectoryEntryPlayerInfo;
      
      public var jobInfoList:Vector.<JobCrafterDirectoryEntryJobInfo>;
      
      public var playerLook:EntityLook;
      
      public function JobCrafterDirectoryEntryMessage()
      {
         this.playerInfo = new JobCrafterDirectoryEntryPlayerInfo();
         this.jobInfoList = new Vector.<JobCrafterDirectoryEntryJobInfo>();
         this.playerLook = new EntityLook();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6044;
      }
      
      public function initJobCrafterDirectoryEntryMessage(param1:JobCrafterDirectoryEntryPlayerInfo = null, param2:Vector.<JobCrafterDirectoryEntryJobInfo> = null, param3:EntityLook = null) : JobCrafterDirectoryEntryMessage
      {
         this.playerInfo = param1;
         this.jobInfoList = param2;
         this.playerLook = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.playerInfo = new JobCrafterDirectoryEntryPlayerInfo();
         this.playerLook = new EntityLook();
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
         this.serializeAs_JobCrafterDirectoryEntryMessage(param1);
      }
      
      public function serializeAs_JobCrafterDirectoryEntryMessage(param1:IDataOutput) : void
      {
         this.playerInfo.serializeAs_JobCrafterDirectoryEntryPlayerInfo(param1);
         param1.writeShort(this.jobInfoList.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.jobInfoList.length)
         {
            (this.jobInfoList[_loc2_] as JobCrafterDirectoryEntryJobInfo).serializeAs_JobCrafterDirectoryEntryJobInfo(param1);
            _loc2_++;
         }
         this.playerLook.serializeAs_EntityLook(param1);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_JobCrafterDirectoryEntryMessage(param1);
      }
      
      public function deserializeAs_JobCrafterDirectoryEntryMessage(param1:IDataInput) : void
      {
         var _loc4_:JobCrafterDirectoryEntryJobInfo = null;
         this.playerInfo = new JobCrafterDirectoryEntryPlayerInfo();
         this.playerInfo.deserialize(param1);
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new JobCrafterDirectoryEntryJobInfo();
            _loc4_.deserialize(param1);
            this.jobInfoList.push(_loc4_);
            _loc3_++;
         }
         this.playerLook = new EntityLook();
         this.playerLook.deserialize(param1);
      }
   }
}
