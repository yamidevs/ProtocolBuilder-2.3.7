package com.ankamagames.dofus.network.types.game.friend
{
   import com.ankamagames.dofus.network.enums.PlayableBreedEnum;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class IgnoredOnlineInformations extends IgnoredInformations implements INetworkType
   {
      
      public static const protocolId:uint = 105;
       
      
      public var playerName:String = "";
      
      public var breed:int = 0;
      
      public var sex:Boolean = false;
      
      public function IgnoredOnlineInformations()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 105;
      }
      
      public function initIgnoredOnlineInformations(param1:String = "", param2:uint = 0, param3:String = "", param4:int = 0, param5:Boolean = false) : IgnoredOnlineInformations
      {
         super.initIgnoredInformations(param1,param2);
         this.playerName = param3;
         this.breed = param4;
         this.sex = param5;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.playerName = "";
         this.breed = 0;
         this.sex = false;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_IgnoredOnlineInformations(param1);
      }
      
      public function serializeAs_IgnoredOnlineInformations(param1:IDataOutput) : void
      {
         super.serializeAs_IgnoredInformations(param1);
         param1.writeUTF(this.playerName);
         param1.writeByte(this.breed);
         param1.writeBoolean(this.sex);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_IgnoredOnlineInformations(param1);
      }
      
      public function deserializeAs_IgnoredOnlineInformations(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.playerName = param1.readUTF();
         this.breed = param1.readByte();
         if(this.breed < PlayableBreedEnum.Feca || this.breed > PlayableBreedEnum.Zobal)
         {
            throw new Error("Forbidden value (" + this.breed + ") on element of IgnoredOnlineInformations.breed.");
         }
         this.sex = param1.readBoolean();
      }
   }
}
