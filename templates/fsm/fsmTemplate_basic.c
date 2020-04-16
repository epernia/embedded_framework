/* Copyright 2018, Eric Pernia.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 */

// FSM DECLARATIONS

// FSM state names
typedef enum{
   STATE_INIT,
   STATE_1,
   STATE_2,
   // ...
   STATE_N
} fsmState_t;

// FSM functions
void fsmError( void );
void fsmInit( void );
void fsmUpdate( void );

// FSM IMPLEMENTATIONS

// Variable that hold the current state
fsmState_t fsmState;

// FSM Error Handler Function
void fsmError( void )
{
   // Error handler, example, restart FSM:
   // fsmState = STATE_INIT;
}

// FSM Initialize Function
void fsmInit( void )
{
   // Example:
   // boardInit();          // Initialize hardwaree
   fsmState = STATE_INIT;   // Set initial state
}

// FSM Update Sate Function
void fsmUpdate( void )
{

   switch( fsmState ){

      case STATE_INIT:
         // ...
      break;

      // ...

      case STATE_N:
         
         /* UPDATE OUTPUTS */
         // Code for update outputs... 
         
         /* CHECK TRANSITION CONDITIONS */
         // Code for check transitions (some ifs)... 

      break;

      default:
         fsmError();
      break;
   }
}