package com.ankamagames.dofus.network.enums
{
   [Trusted]
   public class IdentificationFailureReasonEnum
   {
      
      public static const BAD_VERSION:uint = 1;
      
      public static const WRONG_CREDENTIALS:uint = 2;
      
      public static const BANNED:uint = 3;
      
      public static const KICKED:uint = 4;
      
      public static const IN_MAINTENANCE:uint = 5;
      
      public static const TOO_MANY_ON_IP:uint = 6;
      
      public static const TIME_OUT:uint = 7;
      
      public static const UNKNOWN_AUTH_ERROR:uint = 99;
       
      
      public function IdentificationFailureReasonEnum()
      {
         super();
      }
   }
}
