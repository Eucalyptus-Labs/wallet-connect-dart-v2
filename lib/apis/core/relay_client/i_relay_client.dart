import 'package:event/event.dart';
import 'package:wallet_connect_v2_dart/apis/core/relay_client/relay_client_models.dart';

class PublishOptions {
  final Relay? relay;
  final int? ttl;
  final bool? prompt;
  final int? tag;

  PublishOptions(this.relay, this.ttl, this.prompt, this.tag);
}

abstract class IRelayClient {
  Future<void> init();
  Future<void> publish(
    String topic,
    String message,
    int ttl, {
    bool? prompt,
    int? tag,
  });
  Future<String> subscribe(String topic);
  Future<void> unsubscribe(String topic);
  Future<void> connect(String? relayUrl);
  Future<void> disconnect();

  /// Relay Client Events
  abstract final Event<MessageEvent> onRelayClientMessage;
  abstract final Event onRelayClientConnect;
  abstract final Event onRelayClientDisconnect;
  abstract final Event<ErrorEvent> onRelayClientError;

  /// JSON RPC Events
  // Event<EventArgs> onJsonRpcPayload();
  // Event<EventArgs> onJsonRpcConnect();
  // Event<EventArgs> onJsonRpcDisconnect();
  // Event<ErrorEvent> onJsonRpcError();

  /// Subscriber Events
  abstract final Event<SubscriptionEvent> onSubscriptionCreated;
  abstract final Event<SubscriptionDeletionEvent> onSubscriptionDeleted;
  // Event<EventArgs> onSubscriptionExpired();
  // Event<EventArgs> onSubscriptionDisabled();
  abstract final Event onSubscriptionSync;
  abstract final Event onSubscriptionResubscribed;
}
