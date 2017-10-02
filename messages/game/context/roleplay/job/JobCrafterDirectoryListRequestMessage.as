package com.ankamagames.dofus.network.messages.game.context.roleplay.job
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class JobCrafterDirectoryListRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6047;
       
      
      private var _isInitialized:Boolean = false;
      
      public var jobId:uint = 0;
      
      public function JobCrafterDirectoryListRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6047;
      }
      
      public function initJobCrafterDirectoryListRequestMessage(param1:uint = 0) : JobCrafterDirectoryListRequestMessage
      {
         this.jobId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.jobId = 0;
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
         this.serializeAs_JobCrafterDirectoryListRequestMessage(param1);
      }
      
      public function serializeAs_JobCrafterDirectoryListRequestMessage(param1:IDataOutput) : void
      {
         if(this.jobId < 0)
         {
            throw new Error("Forbidden value (" + this.jobId + ") on element jobId.");
         }
         param1.writeByte(this.jobId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_JobCrafterDirectoryListRequestMessage(param1);
      }
      
      public function deserializeAs_JobCrafterDirectoryListRequestMessage(param1:IDataInput) : void
      {
         this.jobId = param1.readByte();
         if(this.jobId < 0)
         {
            throw new Error("Forbidden value (" + this.jobId + ") on element of JobCrafterDirectoryListRequestMessage.jobId.");
         }
      }
   }
}
