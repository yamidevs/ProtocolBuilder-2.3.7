package com.ankamagames.dofus.network.messages.connection
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.BooleanByteWrapper;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class IdentificationSuccessMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 22;
       
      
      private var _isInitialized:Boolean = false;
      
      public var nickname:String = "";
      
      public var accountId:uint = 0;
      
      public var communityId:uint = 0;
      
      public var hasRights:Boolean = false;
      
      public var secretQuestion:String = "";
      
      public var remainingSubscriptionTime:Number = 0;
      
      public var wasAlreadyConnected:Boolean = false;
      
      public function IdentificationSuccessMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 22;
      }
      
      public function initIdentificationSuccessMessage(param1:String = "", param2:uint = 0, param3:uint = 0, param4:Boolean = false, param5:String = "", param6:Number = 0, param7:Boolean = false) : IdentificationSuccessMessage
      {
         this.nickname = param1;
         this.accountId = param2;
         this.communityId = param3;
         this.hasRights = param4;
         this.secretQuestion = param5;
         this.remainingSubscriptionTime = param6;
         this.wasAlreadyConnected = param7;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.nickname = "";
         this.accountId = 0;
         this.communityId = 0;
         this.hasRights = false;
         this.secretQuestion = "";
         this.remainingSubscriptionTime = 0;
         this.wasAlreadyConnected = false;
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
         this.serializeAs_IdentificationSuccessMessage(param1);
      }
      
      public function serializeAs_IdentificationSuccessMessage(param1:IDataOutput) : void
      {
         var _loc2_:uint = 0;
         BooleanByteWrapper.setFlag(_loc2_,0,this.hasRights);
         BooleanByteWrapper.setFlag(_loc2_,1,this.wasAlreadyConnected);
         param1.writeByte(_loc2_);
         param1.writeUTF(this.nickname);
         if(this.accountId < 0)
         {
            throw new Error("Forbidden value (" + this.accountId + ") on element accountId.");
         }
         param1.writeInt(this.accountId);
         if(this.communityId < 0)
         {
            throw new Error("Forbidden value (" + this.communityId + ") on element communityId.");
         }
         param1.writeByte(this.communityId);
         param1.writeUTF(this.secretQuestion);
         if(this.remainingSubscriptionTime < 0)
         {
            throw new Error("Forbidden value (" + this.remainingSubscriptionTime + ") on element remainingSubscriptionTime.");
         }
         param1.writeDouble(this.remainingSubscriptionTime);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_IdentificationSuccessMessage(param1);
      }
      
      public function deserializeAs_IdentificationSuccessMessage(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readByte();
         this.hasRights = BooleanByteWrapper.getFlag(_loc2_,0);
         this.wasAlreadyConnected = BooleanByteWrapper.getFlag(_loc2_,1);
         this.nickname = param1.readUTF();
         this.accountId = param1.readInt();
         if(this.accountId < 0)
         {
            throw new Error("Forbidden value (" + this.accountId + ") on element of IdentificationSuccessMessage.accountId.");
         }
         this.communityId = param1.readByte();
         if(this.communityId < 0)
         {
            throw new Error("Forbidden value (" + this.communityId + ") on element of IdentificationSuccessMessage.communityId.");
         }
         this.secretQuestion = param1.readUTF();
         this.remainingSubscriptionTime = param1.readDouble();
         if(this.remainingSubscriptionTime < 0)
         {
            throw new Error("Forbidden value (" + this.remainingSubscriptionTime + ") on element of IdentificationSuccessMessage.remainingSubscriptionTime.");
         }
      }
   }
}
