package com.ankamagames.dofus.network.messages.game.report
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class CharacterReportMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6079;
       
      
      private var _isInitialized:Boolean = false;
      
      public var reportedId:uint = 0;
      
      public var reason:uint = 0;
      
      public function CharacterReportMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6079;
      }
      
      public function initCharacterReportMessage(param1:uint = 0, param2:uint = 0) : CharacterReportMessage
      {
         this.reportedId = param1;
         this.reason = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.reportedId = 0;
         this.reason = 0;
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
         this.serializeAs_CharacterReportMessage(param1);
      }
      
      public function serializeAs_CharacterReportMessage(param1:IDataOutput) : void
      {
         if(this.reportedId < 0 || this.reportedId > 4294967295)
         {
            throw new Error("Forbidden value (" + this.reportedId + ") on element reportedId.");
         }
         param1.writeUnsignedInt(this.reportedId);
         if(this.reason < 0)
         {
            throw new Error("Forbidden value (" + this.reason + ") on element reason.");
         }
         param1.writeByte(this.reason);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_CharacterReportMessage(param1);
      }
      
      public function deserializeAs_CharacterReportMessage(param1:IDataInput) : void
      {
         this.reportedId = param1.readUnsignedInt();
         if(this.reportedId < 0 || this.reportedId > 4294967295)
         {
            throw new Error("Forbidden value (" + this.reportedId + ") on element of CharacterReportMessage.reportedId.");
         }
         this.reason = param1.readByte();
         if(this.reason < 0)
         {
            throw new Error("Forbidden value (" + this.reason + ") on element of CharacterReportMessage.reason.");
         }
      }
   }
}
