trigger EngagementActivityTrigger on Engagement_Activity__c (after insert) {
  if (Trigger.isInsert) {
        engagementActivityHandler.updateEngagementScore(Trigger.new);
    }
}