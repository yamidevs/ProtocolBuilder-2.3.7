package com.ankamagames.dofus.network.types.game.context.roleplay
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class BasicGuildInformations implements INetworkType
   {
      
      public static const protocolId:uint = 365;
       
      
      public var guildId:uint = 0;
      
      public var guildName:String = "";
      
      public function BasicGuildInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 365;
      }
      
      public function initBasicGuildInformations(param1:uint = 0, param2:String = "") : BasicGuildInformations
      {
         this.guildId = param1;
         this.guildName = param2;
         return this;
      }
      
      public function reset() : void
      {
         this.guildId = 0;
         this.guildName = "";
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_BasicGuildInformations(param1);
      }
      
      public function serializeAs_BasicGuildInformations(param1:IDataOutput) : void
      {
         if(this.guildId < 0)
         {
            throw new Error("Forbidden value (" + this.guildId + ") on element guildId.");
         }
         param1.writeInt(this.guildId);
         param1.writeUTF(this.guildName);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_BasicGuildInformations(param1);
      }
      
      public function deserializeAs_BasicGuildInformations(param1:IDataInput) : void
      {
         this.guildId = param1.readInt();
         if(this.guildId < 0)
         {
            throw new Error("Forbidden value (" + this.guildId + ") on element of BasicGuildInformations.guildId.");
         }
         this.guildName = param1.readUTF();
      }
   }
}
