package com.ankamagames.dofus.network.messages.connection
{
   import com.ankamagames.dofus.network.types.secure.TrustCertificate;
   import com.ankamagames.dofus.network.types.version.Version;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class IdentificationWithLoginTokenMessage extends IdentificationMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6201;
       
      
      private var _isInitialized:Boolean = false;
      
      public var loginToken:String = "";
      
      public function IdentificationWithLoginTokenMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6201;
      }
      
      public function initIdentificationWithLoginTokenMessage(param1:Version = null, param2:String = "", param3:String = "", param4:Vector.<TrustCertificate> = null, param5:Boolean = false, param6:String = "") : IdentificationWithLoginTokenMessage
      {
         super.initIdentificationMessage(param1,param2,param3,param4,param5);
         this.loginToken = param6;
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
         this.serializeAs_IdentificationWithLoginTokenMessage(param1);
      }
      
      public function serializeAs_IdentificationWithLoginTokenMessage(param1:IDataOutput) : void
      {
         super.serializeAs_IdentificationMessage(param1);
         param1.writeUTF(this.loginToken);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_IdentificationWithLoginTokenMessage(param1);
      }
      
      public function deserializeAs_IdentificationWithLoginTokenMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.loginToken = param1.readUTF();
      }
   }
}
