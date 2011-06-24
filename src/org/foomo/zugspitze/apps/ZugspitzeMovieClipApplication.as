package org.foomo.zugspitze.apps
{
	import org.foomo.zugspitze.core.ZugspitzeController;
	import org.foomo.zugspitze.core.ZugspitzeModel;
	import org.foomo.zugspitze.core.Zugspitze;
	import org.foomo.zugspitze.events.ZugspitzeEvent;

	import flash.display.DisplayObject;
	import flash.display.MovieClip;

	[Event(name="zugspitzeControllerChanged", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeModelChanged", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeViewChanged", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeViewRemove", type="org.foomo.zugspitze.events.ZugspitzeEvent")]
	[Event(name="zugspitzeViewAdd", type="org.foomo.zugspitze.events.ZugspitzeEvent")]

	/**
	 * Zuspitzimplementation extending MovieClip
	 */
	public class ZugspitzeMovieClipApplication extends MovieClip implements IApplication
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * @private
		 */
		protected static var _zugspitze:Zugspitze;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ZugspitzeMovieClipApplication()
		{
			super();
			_zugspitze = new Zugspitze(this);
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_CHANGED, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_ADD, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_VIEW_REMOVE, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_MODEL_CHANGED, this.zugspitzeEventHandler, false, 0, true)
			_zugspitze.addEventListener(ZugspitzeEvent.ZUGSPITZE_CONTROLLER_CHANGED, this.zugspitzeEventHandler, false, 0, true)
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Define Controller Class
		 */
		public function set controllerClass(value:Class):void
		{
			_zugspitze.controllerClass = value;
		}

		/**
		 * Define Model Class
		 */
		public function set modelClass(value:Class):void
		{
			_zugspitze.modelClass = value;
		}

		/**
		 * Define View Class
		 */
		public function set viewClass(value:Class):void
		{
			_zugspitze.viewClass = value;
		}

		/**
		 * Set Controller instance
		 */
		public function set controller(value:ZugspitzeController):void
		{
			_zugspitze.controller = value;
		}

		/**
		 * Set Model instance
		 */
		public function set model(value:ZugspitzeModel):void
		{
			_zugspitze.model = value;
		}

		/**
		 * Set View instance
		 */
		public function set view(value:DisplayObject):void
		{
			_zugspitze.view = value;
		}

		/**
		 * Returns Implementation instance
		 */
		public function get application():IApplication
		{
			return _zugspitze.application;
		}

		/**
		 * Returns Controller instance
		 */
		public function get controller():ZugspitzeController
		{
			return _zugspitze.controller;
		}

		/**
		 * Returns Model instance
		 */
		public function get model():ZugspitzeModel
		{
			return _zugspitze.model;
		}

		/**
		 * Returns View instance
		 */
		public function get view():DisplayObject
		{
			return _zugspitze.view;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Pirvate eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 * @private
		 */
		private function zugspitzeEventHandler(event:ZugspitzeEvent):void
		{
			this.dispatchEvent(event);
		}
	}
}