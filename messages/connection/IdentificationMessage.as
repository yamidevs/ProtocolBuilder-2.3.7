package com.ankamagames.dofus.network.messages.connection
{
   import com.ankamagames.dofus.network.types.secure.TrustCertificate;
   import com.ankamagames.dofus.network.types.version.Version;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class IdentificationMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 4;
       
      
      private var _isInitialized:Boolean = false;
      
      public var version:Version;
      
      [Transient]
      public var login:String = "";
      
      [Transient]
      public var password:String = "";
      
      public var certificate:Vector.<TrustCertificate>;
      
      public var autoconnect:Boolean = false;
      
      public function IdentificationMessage()
      {
         this.version = new Version();
         this.certificate = new Vector.<TrustCertificate>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 4;
      }
      
      public function initIdentificationMessage(param1:Version = null, param2:String = "", param3:String = "", param4:Vector.<TrustCertificate> = null, param5:Boolean = false) : IdentificationMessage
      {
         this.version = param1;
         this.login = param2;
         this.password = param3;
         this.certificate = param4;
         this.autoconnect = param5;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.version = new Version();
         this.password = "";
         this.certificate = new Vector.<TrustCertificate>();
         this.autoconnect = false;
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
         this.serializeAs_IdentificationMessage(param1);
      }
      
      public function serializeAs_IdentificationMessage(param1:IDataOutput) : void
      {
         this.version.serializeAs_Version(param1);
         param1.writeUTF(this.login);
         param1.writeUTF(this.password);
         param1.writeShort(this.certificate.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.certificate.length)
         {
            (this.certificate[_loc2_] as TrustCertificate).serializeAs_TrustCertificate(param1);
            _loc2_++;
         }
         param1.writeBoolean(this.autoconnect);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_IdentificationMessage(param1);
      }
      
      public function deserializeAs_IdentificationMessage(param1:IDataInput) : void
      {
         var _loc4_:TrustCertificate = null;
         this.version = new Version();
         this.version.deserialize(param1);
         this.login = param1.readUTF();
         this.password = param1.readUTF();
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new TrustCertificate();
            _loc4_.deserialize(param1);
            this.certificate.push(_loc4_);
            _loc3_++;
         }
         this.autoconnect = param1.readBoolean();
      }
   }
}
