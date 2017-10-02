package com.ankamagames.dofus.network.types.connection
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameServerInformations implements INetworkType
   {
      
      public static const protocolId:uint = 25;
       
      
      public var id:uint = 0;
      
      public var status:uint = 1;
      
      public var completion:uint = 0;
      
      public var isSelectable:Boolean = false;
      
      public var charactersCount:uint = 0;
      
      public function GameServerInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 25;
      }
      
      public function initGameServerInformations(param1:uint = 0, param2:uint = 1, param3:uint = 0, param4:Boolean = false, param5:uint = 0) : GameServerInformations
      {
         this.id = param1;
         this.status = param2;
         this.completion = param3;
         this.isSelectable = param4;
         this.charactersCount = param5;
         return this;
      }
      
      public function reset() : void
      {
         this.id = 0;
         this.status = 1;
         this.completion = 0;
         this.isSelectable = false;
         this.charactersCount = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_GameServerInformations(param1);
      }
      
      public function serializeAs_GameServerInformations(param1:IDataOutput) : void
      {
         if(this.id < 0 || this.id > 65535)
         {
            throw new Error("Forbidden value (" + this.id + ") on element id.");
         }
         param1.writeShort(this.id);
         param1.writeByte(this.status);
         param1.writeByte(this.completion);
         param1.writeBoolean(this.isSelectable);
         if(this.charactersCount < 0)
         {
            throw new Error("Forbidden value (" + this.charactersCount + ") on element charactersCount.");
         }
         param1.writeByte(this.charactersCount);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameServerInformations(param1);
      }
      
      public function deserializeAs_GameServerInformations(param1:IDataInput) : void
      {
         this.id = param1.readUnsignedShort();
         if(this.id < 0 || this.id > 65535)
         {
            throw new Error("Forbidden value (" + this.id + ") on element of GameServerInformations.id.");
         }
         this.status = param1.readByte();
         if(this.status < 0)
         {
            throw new Error("Forbidden value (" + this.status + ") on element of GameServerInformations.status.");
         }
         this.completion = param1.readByte();
         if(this.completion < 0)
         {
            throw new Error("Forbidden value (" + this.completion + ") on element of GameServerInformations.completion.");
         }
         this.isSelectable = param1.readBoolean();
         this.charactersCount = param1.readByte();
         if(this.charactersCount < 0)
         {
            throw new Error("Forbidden value (" + this.charactersCount + ") on element of GameServerInformations.charactersCount.");
         }
      }
   }
}
