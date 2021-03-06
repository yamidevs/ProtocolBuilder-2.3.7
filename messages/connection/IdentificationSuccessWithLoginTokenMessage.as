package com.ankamagames.dofus.network.messages.connection
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class IdentificationSuccessWithLoginTokenMessage extends IdentificationSuccessMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6209;
       
      
      private var _isInitialized:Boolean = false;
      
      public var loginToken:String = "";
      
      public function IdentificationSuccessWithLoginTokenMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6209;
      }
      
      public function initIdentificationSuccessWithLoginTokenMessage(param1:String = "", param2:uint = 0, param3:uint = 0, param4:Boolean = false, param5:String = "", param6:Number = 0, param7:Boolean = false, param8:String = "") : IdentificationSuccessWithLoginTokenMessage
      {
         super.initIdentificationSuccessMessage(param1,param2,param3,param4,param5,param6,param7);
         this.loginToken = param8;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.loginToken = "";
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
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_IdentificationSuccessWithLoginTokenMessage(param1);
      }
      
      public function serializeAs_IdentificationSuccessWithLoginTokenMessage(param1:IDataOutput) : void
      {
         super.serializeAs_IdentificationSuccessMessage(param1);
         param1.writeUTF(this.loginToken);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_IdentificationSuccessWithLoginTokenMessage(param1);
      }
      
      public function deserializeAs_IdentificationSuccessWithLoginTokenMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.loginToken = param1.readUTF();
      }
   }
}
