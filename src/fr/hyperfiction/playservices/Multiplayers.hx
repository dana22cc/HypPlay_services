package fr.hyperfiction.playservices;

import fr.hyperfiction.playservices.StatusCode;
import nme.events.Event;
import nme.events.EventDispatcher;
import haxe.Json;
import nme.Lib;

/**
 * ...
 * @author shoe[box]
 */
@:build( ShortCuts.mirrors( ) )
class Multiplayers{

	//static public var onEvent : EventDispatcher = new EventDispatcher( );

	/*
	static public var onDatas		: String->String->Void;
	static public var onEvent		: String->RoomDesc->Status->Void;
	static public var onInvitation	: String->InvitationDesc->Status->Void;
	static public var onStatus		: String->String->Status->Void;
	*/

	private static var _listener : MultiplayersListener;

	private static inline var GAME_START		: String = "HypPS_GAME_START";
	private static inline var INVITE_ACCEPTED	: String = "HypPS_INVITE_ACCEPTED";
	private static inline var INVITE_CANCEL		: String = "HypPS_INVITE_CANCEL";
	private static inline var INVITE_SENT		: String = "HypPS_INVITE_SENT";
	private static inline var ON_INVITATION		: String = "HypPS_ON_INVITATION";
	private static inline var ON_MESSAGE		: String = "HypPS_ON_MESSAGE";
	private static inline var PEER_JOINED		: String = "HypPS_PEER_JOINED";
	private static inline var PEER_LEFT		: String = "HypPS_PEER_LEFT";
	private static inline var ROOM_CONNECTED	: String = "HypPS_ROOM_CONNECTED";
	private static inline var ROOM_CREATED		: String = "HypPS_ROOM_CREATED";
	private static inline var ROOM_JOINED		: String = "HypPS_ROOM_JOINED";
	private static inline var ROOM_LEFT		: String = "HypPS_ROOM_LEFT";

	// -------o constructor

		/**
		* constructor
		*
		* @param
		* @return	void
		*/
		public function new() {

		}

	// -------o public

		/**
		* Initialize the multiplayer client
		*
		* @public
		* @return	void
		*/
		static public function initialize( ) : Void {
			trace("initialize");
			/*
			*/

			_setEvent_callback( _onMultiplayers_event );
			_setDatas_callback( _onMultiplayers_datas );

			_listener = new MultiplayersListener( );
			_listener.onEvent = _onMultiplayers_event;
			_listener.onDatas = _onMultiplayers_datas;

		}

		/**
		* Listen for ingame notifications
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function listenFor_invitations( ) : Void {
			trace("listenFor_invitations");
		}

		/**
		* Stop listening for ingames notifications
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function stopListen_for_invitations( ) : Void {

		}

		/**
		* Check for notifications
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function checkFor_invitations( ) : String {
			return null;
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function leaveRoom( ) : Void {

		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function disconnect( ) : Void {

		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function disconnect( ) : Void {

		}

		/**
		* Accept an invitation by it's ID
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function acceptInvitation( sInvitation_id : String ) : Void {

		}

		/**
		* Open the invitations INBOX
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function openInvitations_inbox( ) : Void{

		}

		/**
		* Launch a quick game
		*
		* @public
		* @param iMin : minimal opponents count ( Int )
		* @param iMin : maximal opponents count ( Int )
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function quickGame( iMin : Int , iMax : Int ) : Void {

		}

		/**
		* Invite player
		*
		* @public
		* @param iMin : minimal opponents count ( Int )
		* @param iMin : maximal opponents count ( Int )
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function invitePlayers( iMin : Int , iMax : Int ) : Void{
			trace("invitePlayers");
		}

		/**
		* Open the waiting room.
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function openWaiting_room( ) : Void {

		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function sendString( sMessage : String ) : Void {

		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function sendString_reliable( sMessage : String ) : Void {

		}

	// -------o protected

		/*
		*
		*
		* @private
		* @return	void
		*/
		#if cpp
		@CPP("HypPlayServices","HypPlayServices_set_event_callback_multiplayers")
		#end
		static private function _setEvent_callback( cb : Dynamic ) : Void{

		}

		/*
		*
		*
		* @private
		* @return	void
		*/
		#if cpp
		@CPP("HypPlayServices","HypPlayServices_set_datas_callback_multiplayers")
		#end
		static private function _setDatas_callback( cb : Dynamic ) : Void{

		}

		/**
		*
		*
		* @private
		* @return	void
		*/
		static private function _onMultiplayers_event( sEvent : String , sArg : String , iCode : Int ) : Void{
			trace("_onMultiplayer_event ::: "+sEvent+" - "+iCode);

			var s : Status = StatusCode.translate( iCode );
			trace("s ::: "+s);
			var ev : PSEvent;

			var json : Dynamic = null;
			var ev : PSEvent = null;
			switch( sEvent ){

				case INVITE_ACCEPTED:
					ev = new InvitationEvent( InvitationEvent.ACCEPTED , s , json );

				case INVITE_SENT:
					ev = new InvitationEvent( InvitationEvent.SENT , s , null );

				case INVITE_CANCEL:
					ev = new InvitationEvent( InvitationEvent.CANCEL , s , null );

				case ON_INVITATION:
					/*
					try{
						json = Json.parse( sArg );
					}catch( e : nme.errors.Error ){
						trace( e );
						trace( sArg );
					}
					ev = new InvitationEvent( InvitationEvent.RECEIVED , s , json );
					*/

				case ROOM_CREATED:
					try{
						json = Json.parse( sArg );
					}catch( e : nme.errors.Error ){
						trace( e );
						trace( sArg );
					}
					trace( s );
					trace( json );
					ev = new RoomEvent( RoomEvent.CREATED , s , json );

				case ON_MESSAGE:
					ev = new MultiplayersEvent( MultiplayersEvent.ON_MESSAGE , s , sArg );

				case ROOM_CONNECTED:
					ev = new RoomEvent( RoomEvent.CONNECTED , s );

				case GAME_START:
					ev = new MultiplayersEvent( MultiplayersEvent.GAME_START , s , sArg );

				case PEER_JOINED:
					ev = new MultiplayersEvent( RoomEvent.PEER_JOINED , s , sArg );

				case PEER_LEFT:
					ev = new MultiplayersEvent( RoomEvent.PEER_LEFT , s , sArg );

				default:
					trace("onEvent ::: "+sEvent+" - "+iCode);
					//if( onStatus != null )
					//	onStatus( sEvent , sArg , s );

			}

			if( ev != null ){
				trace("dispatch ::: "+ev);
				trace( ev.type );
				trace( "hasListener ::: "+Lib.current.stage.hasEventListener( ev.type ));
				Lib.current.stage.dispatchEvent( ev.clone( ) );
			}
		}

		/**
		*
		*
		* @private
		* @return	void
		*/
		static private function _onMultiplayers_datas( sDatas : String , sFrom : String ) : Void{
			trace("_onMultiplayers_datas ::: "+sDatas+" from :"+sFrom);
		}

	// -------o misc

}


/**
 * ...
 * @author shoe[box]
 */

class MultiplayersEvent extends PSEvent{

	public var sMessage : String;

	public static inline var GAME_START	: String = "HypPS_GAME_START";
	public static inline var ON_MESSAGE	: String = "HypPS_ON_MESSAGE";

	// -------o constructor

		/**
		* constructor
		*
		* @param
		* @return	void
		*/
		public function new( t : String , statusCode : Status , ?sMessage : String ) {
			super( t , statusCode );
			this.sMessage = sMessage;
		}

	// -------o public

		/**
		*
		*
		* @public
		* @return	void
		*/
		override public function clone( ) : MultiplayersEvent {
			return new MultiplayersEvent( type , status , sMessage );
		}

	// -------o protected



	// -------o misc

}

/**
 * ...
 * @author shoe[box]
 */

class InvitationEvent extends PSEvent{

	public var invit : InvitationDesc;

	public static inline var ACCEPTED	: String = "HypPS_INVITE_ACCEPTED";
	public static inline var CANCEL	: String = "HypPS_INVITE_CANCEL";
	public static inline var RECEIVED	: String = "HypPS_ON_INVITATION";
	public static inline var SENT		: String = "HypPS_INVITE_SENT";

	// -------o constructor

		/**
		* constructor
		*
		* @param
		* @return	void
		*/
		public function new( t : String , statusCode : Status , ?invit : InvitationDesc ) {
			super( t , statusCode );
			this.invit = invit;
		}

	// -------o public

		/**
		*
		*
		* @public
		* @return	void
		*/
		public override function clone() : InvitationEvent {
			return new InvitationEvent( type , status , this.invit );
		}

	// -------o protected



	// -------o misc

}

/**
 * ...
 * @author shoe[box]
 */
class RoomEvent extends PSEvent{

	public var roomDesc : RoomDesc;

	public static inline var CONNECTED		: String = "HypPS_ROOM_CONNECTED";
	public static inline var CREATED		: String = "HypPS_ROOM_CREATED";
	public static inline var JOINED		: String = "HypPS_ROOM_JOINED";
	public static inline var LEFT			: String = "HypPS_ROOM_LEFT";
	public static inline var PEER_JOINED	: String = "HypPS_PEER_JOINED";
	public static inline var PEER_LEFT		: String = "HypPS_PEER_LEFT";

	// -------o constructor

		/**
		* constructor
		*
		* @param
		* @return	void
		*/
		public function new( t : String , statusCode : Status , ?roomDesc : RoomDesc ) {
			super( t , statusCode );
			this.roomDesc = roomDesc;
		}

	// -------o public

		/**
		*
		*
		* @public
		* @return	void
		*/
		public override function clone() : RoomEvent {
			var 	ev = new RoomEvent( type , status );
				ev.roomDesc = roomDesc;
			return ev;
		}

	// -------o protected



	// -------o misc

}

/**
 * ...
 * @author shoe[box]
 */

class PSEvent extends Event{

	public var status : Status;

	// -------o constructor

		/**
		* constructor
		*
		* @param
		* @return	void
		*/
		public function new( t : String , status : Status ) {
			super( t );
			this.status = status;
		}

	// -------o public



	// -------o protected



	// -------o misc

}

class MultiplayersListener{

	public var onEvent : String->String->Int->Void;
	public var onDatas : String->String->Void;

	// -------o constructor

		/**
		* constructor
		*
		* @param
		* @return	void
		*/
		public function new() {

		}

	// -------o public



	// -------o protected



	// -------o misc

}

typedef RoomDesc={
	public var createId			: String;
	public var creationtimestamp	: Int;
	public var description		: String;
	public var participants		: Array<String>;
	public var roomId			: String;
	public var status			: Int;
	public var variant			: Int;
}

typedef InvitationDesc={
	public var from			: InvitationFrom;
	public var sInvitation_id	: String;
	public var sTimestamp		: String;
}

typedef InvitationFrom={
	public var bConnected_to_room	: Bool;
	public var iStatus			: Int;
	public var sFrom_icon_uri	: String;
	public var sFrom_id			: String;
	public var sFrom_image_uri	: String;
	public var sFrom_name		: String;
}